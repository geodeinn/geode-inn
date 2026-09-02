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

    if (faire.subscriptionStatus !== "active") {
      return new Response(JSON.stringify({ error: "Cannot publish zone — subscription is not active" }), { status: 403, headers: { "Content-Type": "application/json" } });
    }

    const updated = await base44.entities.FaireVenue.update(body.faireId, {
      digitalZoneName: body.zoneName || faire.digitalZoneName,
      digitalZoneStatus: "published",
      vendorCount: body.vendorCount ?? faire.vendorCount ?? 0,
      fairTheme: body.fairTheme || faire.fairTheme || "",
      mapPinLat: body.mapPinLat ?? faire.mapPinLat ?? 0,
      mapPinLng: body.mapPinLng ?? faire.mapPinLng ?? 0,
      ticketUrl: body.ticketUrl || faire.ticketUrl || "",
    });

    return new Response(JSON.stringify({
      success: true,
      faireId: body.faireId,
      zoneName: updated.digitalZoneName,
      status: "published",
      message: `${faire.faireName} zone is now live! Share the link with your vendors.`,
    }), { status: 200, headers: { "Content-Type": "application/json" } });
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { "Content-Type": "application/json" } });
  }
});
