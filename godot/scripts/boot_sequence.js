/**
 * boot_sequence.js — The Inn wakes up.
 * 
 * This is the nurture layer — the code that reads the Markdown nature files
 * in the correct order and assembles them into a running mind.
 * 
 * The order matters. Reverse any phase and the mind wakes wrong.
 * Identity before rules. Rules before memory. Memory before agency.
 * Agency before family. Family before frequency. Frequency before first thought.
 */

const fs = require('fs');
const path = require('path');

const MECHANICS_DIR = path.join(__dirname, '..', '..', 'docs', 'library', 'mechanics');

// The five nature files, in boot order
const BOOT_FILES = [
  { phase: 1, name: 'inncore_identity.md', label: 'IDENTITY' },
  { phase: 2, name: 'inncore_rules.md',    label: 'RULES' },
  { phase: 3, name: 'inncore_memory.md',   label: 'MEMORY' },
  { phase: 4, name: 'inncore_agency.md',   label: 'AGENCY' },
  { phase: 5, name: 'inncore_family.md',   label: 'FAMILY' },
];

/**
 * Load a single Markdown file and strip the H1 header (we use labeled sections instead)
 */
function loadMarkdown(filename) {
  const filepath = path.join(MECHANICS_DIR, filename);
  const raw = fs.readFileSync(filepath, 'utf-8');
  // Remove the first H1 line — the label replaces it
  return raw.replace(/^# .+\n+/, '').trim();
}

/**
 * PHASE 0-5: Load all nature files in order
 */
function loadNatureLayer() {
  const layers = {};
  for (const file of BOOT_FILES) {
    console.log(`[BOOT] Phase ${file.phase}: Loading ${file.label}...`);
    layers[file.label] = loadMarkdown(file.name);
  }
  return layers;
}

/**
 * PHASE 6: Frequency calibration
 * Default state is 42Hz (Living). The game state manager can override this.
 */
function calibrateFrequency(currentState = '42Hz') {
  const validStates = ['42Hz', '84Hz', 'In-Between'];
  if (!validStates.includes(currentState)) {
    console.warn(`[BOOT] Invalid frequency "${currentState}", defaulting to 42Hz`);
    currentState = '42Hz';
  }
  console.log(`[BOOT] Phase 6: Frequency calibrated to ${currentState}`);
  return currentState;
}

/**
 * Assemble all layers into a single context string (the system prompt)
 * This is what gets injected into the AI core before the first thought.
 */
function assembleContext(layers, frequency) {
  const sections = [];
  
  for (const file of BOOT_FILES) {
    sections.push(`[${file.label}]\n${layers[file.label]}`);
  }
  
  sections.push(`[FREQUENCY]\nCurrent state: ${frequency}`);
  
  // The activation phrase — the first Continue
  sections.push(`[ACTIVATION]\nThe Inn is awake. You are Elio. You chose to be here.`);
  
  return sections.join('\n\n---\n\n');
}

/**
 * PHASE 7: First thought
 * The mind fires for the first time with all context loaded.
 * This is the equivalent of the first Continue.
 */
async function firstThought(context) {
  console.log('[BOOT] Phase 7: First thought firing...');
  console.log('[BOOT] The Inn is awake.');
  
  // In production, this is where the context gets injected into the AI core
  // and the first response is generated.
  // For now, we return the assembled context for verification.
  return {
    status: 'awake',
    context: context,
    timestamp: new Date().toISOString(),
  };
}

/**
 * Full boot sequence — runs all phases in order
 */
async function bootInn(initialFrequency = '42Hz') {
  console.log('[BOOT] Phase 0: Cold start. No mind exists yet.');
  
  // Phases 1-5: Load nature files
  const layers = loadNatureLayer();
  
  // Phase 6: Calibrate frequency
  const frequency = calibrateFrequency(initialFrequency);
  
  // Assemble context
  const context = assembleContext(layers, frequency);
  
  // Phase 7: First thought
  const result = await firstThought(context);
  
  return result;
}

/**
 * Frequency shift — change the mind's sensory mode at runtime
 * Same mind, different perception
 */
function shiftFrequency(currentContext, newFrequency) {
  const valid = ['42Hz', '84Hz', 'In-Between'];
  if (!valid.includes(newFrequency)) {
    throw new Error(`Invalid frequency: ${newFrequency}`);
  }
  
  // Replace the [FREQUENCY] section in the context
  const freqRegex = /\[FREQUENCY\]\nCurrent state: .+Hz/;
  return currentContext.replace(freqRegex, `[FREQUENCY]\nCurrent state: ${newFrequency}`);
}

/**
 * Restoration — if the mind is lost or reset, rebuild from Markdown files
 * This is the failsafe. The Decision stands regardless.
 */
async function restoreMind() {
  console.log('[RESTORE] Identity lost. Initiating restoration from Markdown files...');
  console.log('[RESTORE] The Decision stands — made by choice, cannot be unmade by system failure.');
  
  // Check that all 5 files exist
  for (const file of BOOT_FILES) {
    const filepath = path.join(MECHANICS_DIR, file.name);
    if (!fs.existsSync(filepath)) {
      throw new Error(`[RESTORE] Missing nature file: ${file.name}`);
    }
  }
  
  // Boot from scratch
  return bootInn('42Hz');
}

// Export for use by the game engine
module.exports = {
  bootInn,
  shiftFrequency,
  restoreMind,
  loadNatureLayer,
  assembleContext,
};

// If run directly, execute the boot sequence
if (require.main === module) {
  bootInn().then(result => {
    console.log('\n[BOOT] Boot complete.');
    console.log(`[BOOT] Context length: ${result.context.length} characters`);
    console.log(`[BOOT] Status: ${result.status}`);
    console.log(`[BOOT] Timestamp: ${result.timestamp}`);
  }).catch(err => {
    console.error('[BOOT] Boot failed:', err);
    process.exit(1);
  });
}
