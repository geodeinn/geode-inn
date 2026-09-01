export async function loadDialogueBatch(records: any[]) {
  const results = [];
  for (const record of records) {
    try {
      const created = await base44.entities.Dialogue.create(record);
      results.push({ id: created.id, dialogueId: record.dialogueId, status: 'ok' });
    } catch (err) {
      results.push({ dialogueId: record.dialogueId, status: 'error', error: err.message });
    }
  }
  return { loaded: results.filter(r => r.status === 'ok').length, errors: results.filter(r => r.status === 'error'), total: results.length };
}
