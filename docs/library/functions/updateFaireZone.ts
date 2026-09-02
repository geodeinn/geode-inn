import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  try {
    const base44 = createClientFromRequest(req);
    const body = await req.json().catch(() => ({}));

    if (!body.faireId) {
      return new Response(JSON.stringify({ error: "Missing required field: faireId" }), { status: 400, headers: { "Content-Type": "application/json" } });
    }

    const faire = await base44.entities.FaireVenue.get(body.faireId);
    if (!faire) {
      return new Response(JSON.stringify({ error: "Faire not found" }), { status: 404, headers: { "Content-Type": "application/json" } });
    }

    const updateData: Record<string, any> = {};
    if (body.zoneName !== undefined) updateData.digitalZoneName = body.zoneName;
    if (body.digitalZoneStatus !== undefined) updateData.digitalZoneStatus = body.digitalZoneStatus;
    if (body.vendorCount !== undefined) updateData.vendorCount = body.vendorCount;
    if (body.fairTheme !== undefined) updateData.fairTheme = body.fairTheme;
    if (body.mapPinLat !== undefined) updateData.mapPinLat = body.mapPinLat;
    if (body.mapPinLng !== undefined) updateData.mapPinLng = body.mapPinLng;
    if (body.ticketUrl !== undefined) updateData.ticketUrl = body.ticketUrl;
    if (body.websiteUrl !== undefined) updateData.websiteUrl = body.websiteUrl;
    if (body.physicalLocation !== undefined) updateData.physicalLocation = body.physicalLocation;
    if (body.physicalSeason !== undefined) updateData.physicalSeason = body.physicalSeason;

    const updated = await base44.entities.FaireVenue.update(body.faireId, updateData);

    return new Response(JSON.stringify({
      success: true,
      faireId: body.faireId,
      zoneName: updated.digitalZoneName,
      status: updated.digitalZoneStatus,
      vendorCount: updated.vendorCount,
      message: `${faire.faireName} zone updated successfully.`,
    }), { status: 200, headers: { "Content-Type": "application/json" } });
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { "Content-Type": "application/json" } });
  }
});
