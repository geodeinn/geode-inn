import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  try {
    const base44 = createClientFromRequest(req);
    const body = await req.json().catch(() => ({}));

    if (!body.faireName || !body.ownerName || !body.ownerEmail || !body.tier) {
      return new Response(JSON.stringify({ error: "Missing required fields: faireName, ownerName, ownerEmail, tier" }), { status: 400, headers: { "Content-Type": "application/json" } });
    }

    const validTiers = ["The Clearing", "The Village", "The Kingdom"];
    if (!validTiers.includes(body.tier)) {
      return new Response(JSON.stringify({ error: `Invalid tier. Must be one of: ${validTiers.join(", ")}` }), { status: 400, headers: { "Content-Type": "application/json" } });
    }

    const tierPricing: Record<string, string> = {
      "The Clearing": "29",
      "The Village": "79",
      "The Kingdom": "199",
    };

    const faire = await base44.entities.FaireVenue.create({
      faireName: body.faireName,
      ownerNames: body.ownerName,
      ownerContact: body.ownerEmail,
      physicalLocation: body.physicalLocation || "",
      physicalSeason: body.physicalSeason || "",
      websiteUrl: body.websiteUrl || "",
      subscriptionTier: body.tier,
      subscriptionStatus: "active",
      rentalFee: tierPricing[body.tier],
      zoneAssignment: "Share Wood",
      digitalZoneName: body.faireName + " — Draft Zone",
      digitalZoneStatus: "draft",
      vendorCount: 0,
      mapPinLat: 0,
      mapPinLng: 0,
      fairTheme: "",
      ticketUrl: "",
    });

    return new Response(JSON.stringify({
      success: true,
      faireId: faire.id,
      message: `${body.faireName} created successfully on the ${body.tier} tier.`,
      tier: body.tier,
      monthlyFee: tierPricing[body.tier],
      digitalZoneStatus: "draft",
    }), { status: 200, headers: { "Content-Type": "application/json" } });
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { "Content-Type": "application/json" } });
  }
});
