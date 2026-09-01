// The Common Room — GeoCities-style chat room for the Geode Inn
// No database. No persistence. Everything in memory. The fire stays, the words don't.

interface Traveler {
  id: string;
  name: string;
  joinedAt: number;
  canSpeakAt: number;
  canFrogAt: number;
  isFrog: boolean;
  frogName: string | null;
  frogCount: number;
  lastSeen: number;
  froggedBy: string[];
}

interface Message {
  id: string;
  travelerId: string;
  travelerName: string;
  text: string;
  timestamp: number;
  type: 'say' | 'system' | 'frog';
  ink: 'sepia' | 'gold' | 'green';
}

interface RoomState {
  travelers: Map<string, Traveler>;
  messages: Message[];
  heightened: boolean;
  heightenedUntil: number;
  messageCounter: number;
}

const room: RoomState = {
  travelers: new Map(),
  messages: [],
  heightened: false,
  heightenedUntil: 0,
  messageCounter: 0,
};

const THRESHOLD_MS = 45000;
const THRESHOLD_HEIGHTENED_MS = 120000;
const FROG_COOLDOWN_MS = 120000;
const FROG_VOTES_NEEDED = 3;
const FROG_TRANSFORMATIONS_TO_REMOVE = 3;
const TRAVELER_TIMEOUT_MS = 60000;
const MAX_MESSAGES = 100;
const MAX_MESSAGE_LENGTH = 500;
const HEIGHTENED_DURATION_MS = 300000;

const STONE_NAMES = [
  'Quartz', 'Amethyst', 'Garnet', 'Obsidian', 'Labradorite', 'Moonstone',
  'Onyx', 'Jade', 'Opal', 'Topaz', 'Turquoise', 'Malachite', 'Lapis',
  'Tiger-Eye', 'Bloodstone', 'Carnelian', 'Jasper', 'Agate', 'Fluorite',
  'Hematite', 'Pyrite', 'Selenite', 'Kyanite', 'Iolite', 'Sugilite',
  'Charoite', 'Rhodonite', 'Seraphinite', 'Larimar', 'Moldavite',
];

const FROG_NAMES = [
  'Tadpole', 'Newt', 'Polywog', 'Bullfrog', 'Treefrog', 'Toad',
  'Spring-Peeper', 'Guppy', 'Minnow', 'Creek-Frog',
];

const RIBBITS = ['ribbit', 'croak', 'grrribbit', 'ribbit ribbit', 'crooooak', 'ribbit?', '*blinks*'];

const FIRE_AMBIENT = [
  'The fire pops and settles.',
  'A draft moves through the stones.',
  'The hearth clicks with the heat.',
  'The wood shifts. The room breathes.',
  'A spark rises and dies in the dark.',
  'The fire crackles low.',
  'The stones hold the warmth.',
  'The room is quiet. The fire is not.',
];

function generateId(): string {
  return Math.random().toString(36).substring(2, 12) + Date.now().toString(36);
}

function randomStoneName(): string {
  const stone = STONE_NAMES[Math.floor(Math.random() * STONE_NAMES.length)];
  const suffix = String.fromCharCode(65 + Math.floor(Math.random() * 26));
  return `${stone}-${suffix}`;
}

function randomFrogName(): string {
  const frog = FROG_NAMES[Math.floor(Math.random() * FROG_NAMES.length)];
  const num = Math.floor(Math.random() * 99) + 1;
  return `${frog}-${num}`;
}

function getThreshold(): number {
  return room.heightened ? THRESHOLD_HEIGHTENED_MS : THRESHOLD_MS;
}

function checkHeightened(): void {
  if (room.heightened && Date.now() > room.heightenedUntil) {
    room.heightened = false;
  }
}

function triggerHeightened(): void {
  room.heightened = true;
  room.heightenedUntil = Date.now() + HEIGHTENED_DURATION_MS;
}

function addMessage(msg: Omit<Message, 'id' | 'timestamp'>): Message {
  const message: Message = { ...msg, id: generateId(), timestamp: Date.now() };
  room.messages.push(message);
  if (room.messages.length > MAX_MESSAGES) {
    room.messages = room.messages.slice(-MAX_MESSAGES);
  }
  room.messageCounter++;
  return message;
}

function cleanupStaleTravelers(): void {
  const now = Date.now();
  const toRemove: string[] = [];
  for (const [id, traveler] of room.travelers) {
    if (now - traveler.lastSeen > TRAVELER_TIMEOUT_MS) {
      toRemove.push(id);
    }
  }
  for (const id of toRemove) {
    const traveler = room.travelers.get(id);
    if (traveler) {
      addMessage({
        travelerId: 'system', travelerName: 'The Fire',
        text: `${traveler.frogName || traveler.name} drifts from the fireside. The room exhales.`,
        type: 'system', ink: 'gold',
      });
      room.travelers.delete(id);
    }
  }
}

function getOnlineList() {
  return Array.from(room.travelers.values()).map(t => ({ id: t.id, name: t.frogName || t.name, isFrog: t.isFrog }));
}

function getRecentMessages(since: number): Message[] {
  return room.messages.filter(m => m.timestamp > since);
}

function maybeAmbientFire(): void {
  if (Math.random() < 0.15 && room.travelers.size > 0) {
    const line = FIRE_AMBIENT[Math.floor(Math.random() * FIRE_AMBIENT.length)];
    addMessage({ travelerId: 'system', travelerName: 'The Fire', text: line, type: 'system', ink: 'gold' });
  }
}

function json(data: any, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}

Deno.serve(async (req: Request) => {
  try {
    const body = await req.json();
    const action = body.action;
    cleanupStaleTravelers();
    checkHeightened();

    switch (action) {
      case 'join': {
        const requestedName = body.name?.trim()?.substring(0, 30);
        const name = requestedName || randomStoneName();
        let finalName = name;
        const existingNames = Array.from(room.travelers.values()).map(t => t.frogName || t.name);
        if (existingNames.includes(finalName)) {
          finalName = `${name}-${String.fromCharCode(65 + Math.floor(Math.random() * 26))}`;
        }
        const now = Date.now();
        const threshold = getThreshold();
        const traveler: Traveler = {
          id: generateId(), name: finalName, joinedAt: now,
          canSpeakAt: now + threshold, canFrogAt: now + FROG_COOLDOWN_MS,
          isFrog: false, frogName: null, frogCount: 0, lastSeen: now, froggedBy: [],
        };
        room.travelers.set(traveler.id, traveler);
        addMessage({ travelerId: 'system', travelerName: 'The Fire', text: `${finalName} enters the Common Room, warming by the fire.`, type: 'system', ink: 'gold' });
        return json({ travelerId: traveler.id, travelerName: finalName, threshold, heightened: room.heightened, canSpeakAt: traveler.canSpeakAt, online: getOnlineList(), onlineCount: room.travelers.size, recentMessages: getRecentMessages(now - 60000) });
      }
      case 'listen': {
        const traveler = room.travelers.get(body.travelerId);
        if (!traveler) return json({ error: 'You are not in the Common Room.', expired: true }, 404);
        traveler.lastSeen = Date.now();
        const since = body.since || 0;
        maybeAmbientFire();
        const thresholdRemaining = Math.max(0, traveler.canSpeakAt - Date.now());
        const frogCooldownRemaining = Math.max(0, traveler.canFrogAt - Date.now());
        return json({ online: getOnlineList(), onlineCount: room.travelers.size, messages: getRecentMessages(since), heightened: room.heightened, thresholdRemaining, frogCooldownRemaining, isFrog: traveler.isFrog, travelerName: traveler.frogName || traveler.name });
      }
      case 'say': {
        const traveler = room.travelers.get(body.travelerId);
        if (!traveler) return json({ error: 'You are not in the Common Room.', expired: true }, 404);
        traveler.lastSeen = Date.now();
        if (Date.now() < traveler.canSpeakAt) {
          const remaining = Math.ceil((traveler.canSpeakAt - Date.now()) / 1000);
          return json({ success: false, error: `You're still warming by the fire... ${remaining}s` });
        }
        let text = (body.text || '').trim().substring(0, MAX_MESSAGE_LENGTH);
        if (!text) return json({ success: false, error: 'Nothing to say.' });
        if (traveler.isFrog) text = RIBBITS[Math.floor(Math.random() * RIBBITS.length)];
        addMessage({ travelerId: traveler.id, travelerName: traveler.frogName || traveler.name, text, type: 'say', ink: traveler.isFrog ? 'green' : 'sepia' });
        return json({ success: true });
      }
      case 'frog': {
        const traveler = room.travelers.get(body.travelerId);
        if (!traveler) return json({ error: 'You are not in the Common Room.', expired: true }, 404);
        traveler.lastSeen = Date.now();
        if (Date.now() < traveler.canFrogAt) {
          const remaining = Math.ceil((traveler.canFrogAt - Date.now()) / 1000);
          return json({ success: false, error: "You haven't been by the fire long enough. The community doesn't know you yet.", cooldownRemaining: remaining });
        }
        if (body.targetId === traveler.id) return json({ success: false, error: 'You cannot frog yourself.' });
        const target = room.travelers.get(body.targetId);
        if (!target) return json({ success: false, error: 'That traveler is no longer here.' });
        if (target.froggedBy.includes(traveler.id)) return json({ success: false, error: 'You have already frogged this traveler.' });
        target.froggedBy.push(traveler.id);
        const votes = target.froggedBy.length;
        if (votes >= FROG_VOTES_NEEDED) {
          target.frogCount++;
          target.isFrog = true;
          target.frogName = randomFrogName();
          target.froggedBy = [];
          addMessage({ travelerId: 'system', travelerName: 'The Fire', text: `${target.name} has been transformed. The traveler is now ${target.frogName}. The swamp reclaiming its own.`, type: 'frog', ink: 'gold' });
          if (target.frogCount >= FROG_TRANSFORMATIONS_TO_REMOVE) {
            addMessage({ travelerId: 'system', travelerName: 'The Fire', text: `${target.frogName} has been claimed by the swamp. The traveler is gone. The fire burns low.`, type: 'system', ink: 'gold' });
            room.travelers.delete(target.id);
            triggerHeightened();
            return json({ success: true, frogCount: votes, transformed: true, swampClaimed: true });
          }
          return json({ success: true, frogCount: votes, transformed: true, newFrogName: target.frogName });
        }
        addMessage({ travelerId: 'system', travelerName: 'The Fire', text: `A traveler gestures at ${target.frogName || target.name}. (${votes}/${FROG_VOTES_NEEDED})`, type: 'frog', ink: 'gold' });
        return json({ success: true, frogCount: votes, transformed: false });
      }
      case 'leave': {
        const traveler = room.travelers.get(body.travelerId);
        if (!traveler) return json({ success: true, message: 'You left the Common Room. Your words are gone. The fire stays.' });
        const name = traveler.frogName || traveler.name;
        room.travelers.delete(traveler.id);
        addMessage({ travelerId: 'system', travelerName: 'The Fire', text: `${name} leaves the Common Room. The fire settles.`, type: 'system', ink: 'gold' });
        return json({ success: true, message: 'You left the Common Room. Your words are gone. The fire stays.' });
      }
      case 'status': {
        return json({ onlineCount: room.travelers.size, online: getOnlineList(), heightened: room.heightened, messageCount: room.messageCounter });
      }
      default:
        return json({ error: `Unknown action: ${action}. Valid actions: join, listen, say, frog, leave, status` }, 400);
    }
  } catch (err: any) {
    console.error('Common Room error:', err);
    return json({ error: 'The fire flickered. Try again.', details: err.message }, 500);
  }
});
