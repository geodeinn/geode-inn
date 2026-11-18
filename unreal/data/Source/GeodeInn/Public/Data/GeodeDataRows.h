// Row structs for the Geode Inn DataTables (Content/Data/Tables/*.json).
// Generated from the game data by unreal-tools/build_tables.py; regenerate rather than edit by hand.
#pragma once

#include "CoreMinimal.h"
#include "Engine/DataTable.h"
#include "GeodeDataRows.generated.h"

// Stones: docs/base44_data/elio/Stone.json + docs/base44_data/live/Stone.json
USTRUCT(BlueprintType)
struct FGeodeStonesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Opacity;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString OpticalPhenomenon;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Varieties;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool CanCabochon = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ImageFile;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GeoRegion;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float MapPinLng = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ColorNotes;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool CanFacet = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float MapPinLat = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString StoneFamily;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Body;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Mind;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CabochonShapes;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Category;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BeadFinish;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Country;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ShortDescription;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Color;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ImageUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Description;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float SpecificGravity = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SourceUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DiscoveredBy;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Tags;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float Hardness = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Era;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float FrequencyHz = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString IemDriver;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString MetaphysicalProperty;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Rarity;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Element;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// Materials: docs/base44_data/elio/Material.json + docs/base44_data/live/Material.json
USTRUCT(BlueprintType)
struct FGeodeMaterialsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Category;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float RespawnMinutes = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Rarity;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ToolRequired;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float BuildingTier = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Description;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Source;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ClimateCycle;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CraftPairing;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CraftPillar;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CraftProperty;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RitualRole;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Symbol;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString MaterialId;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString StoneName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	int32 Tier = 0;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SourceType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float FrequencyHz = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RecipeInputA;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RecipeInputB;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	int32 GatheringLevel = 0;

};

// BuildingRecipes: docs/base44_data/elio/BuildingRecipe.json + docs/base44_data/live/BuildingRecipe.json
USTRUCT(BlueprintType)
struct FGeodeBuildingRecipesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Quantities;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	int32 BuildingTier = 0;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Description;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CraftingStation;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Materials;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ResultType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Symbol;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	int32 Tier = 0;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString StructureType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LoreConnection;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Unlocks;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RecipeId;

};

// GameItems: docs/base44_data/elio/GameItem.json
USTRUCT(BlueprintType)
struct FGeodeGameItemsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString InteractiveProperties;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ItemType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Materials;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Variants;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Description;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BasedOn;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// MarketItems: docs/base44_data/elio/MarketItem.json + docs/base44_data/live/MarketItem.json
USTRUCT(BlueprintType)
struct FGeodeMarketItemsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ArtisanShopName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LoreConnection;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Rarity;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GameDescription;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PriceRange;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ArtisanName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DevelopmentStatus;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ExternalUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool IsSoulsticeItem = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ArtisanShopUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Category;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RealDescription;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RealImage;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString StoneType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GameEffect;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool InStock = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ProcessUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GameImage;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RealName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Description;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GameName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ImageUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Status;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PriceRangeAlt;

};

// ElementCharms: docs/base44_data/elio/ElementCharm.json
USTRUCT(BlueprintType)
struct FGeodeElementCharmsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ElementCategory;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CharmDescription;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Rarity;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float AtomicNumber = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float AtomicWeight = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float AcquisitionTier = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ConnectedStones;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString AlchemicalNote;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ElementName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ElementSymbol;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString QuestConnection;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// QuestCharms: docs/base44_data/elio/QuestCharm.json
USTRUCT(BlueprintType)
struct FGeodeQuestCharmsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CharmType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString NpcConnection;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RewardEffect;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString StoryThread;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString EarnedFrom;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString QuestName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Rarity;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Description;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Appearance;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// Dialogue: docs/base44_data/elio/Dialogue.json + docs/base44_data/live/Dialogue.json
USTRUCT(BlueprintType)
struct FGeodeDialogueRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Lines;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString NpcName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float Priority = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DialogueId;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Responses;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ConditionTag;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> SetFlags;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString VoiceProfile;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString QuestLink;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool IsWhisperLayer = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GodotProfile;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString HookWord;

};

// Lore: docs/base44_data/elio/Lore.json + docs/base44_data/live/Lore.json
USTRUCT(BlueprintType)
struct FGeodeLoreRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Country;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool HasWaterCreature = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float MapPinLng = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Creatures;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool HasStoneCircle = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString FullText;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float MapPinLat = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Region;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> WaterCreatures;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Category;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Summary;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ImageUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Author;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Source;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Title;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Content;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Tags;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Era;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RelatedStone;

};

// Books: docs/base44_data/elio/Book.json + docs/base44_data/live/Book.json
USTRUCT(BlueprintType)
struct FGeodeBooksRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float PageCount = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float DownloadCount = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool HasOcr = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString OcrStatus;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString OriginalText;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ArchiveOrgId;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> AvailableLanguages;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString InGameZone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Title;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Publisher;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString TitleTranslated;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LanguageName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LanguageIso;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SourceUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString TranslationCount;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PublicationDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Category;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Tags;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Region;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Author;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CoverUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// BookTranslations: docs/base44_data/live/BookTranslation.json
USTRUCT(BlueprintType)
struct FGeodeBookTranslationsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString TranslatedText;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Method;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString TranslatorName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Format;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString TargetLanguageName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString FormatStatus;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ReadUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString TargetLanguageIso;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BookId;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BookTitle;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// ScholarlyBridges: docs/base44_data/live/ScholarlyBridge.json
USTRUCT(BlueprintType)
struct FGeodeScholarlyBridgesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Note;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ScholarName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BridgeLanguage;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	int32 Year = 0;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BookId;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BookTitle;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// ComicStrips: docs/base44_data/elio/ComicStrip.json + docs/base44_data/live/ComicStrip.json
USTRUCT(BlueprintType)
struct FGeodeComicStripsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Characters;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool IsPublished = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Panels;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	int32 StripNumber = 0;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Title;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ArtStyle;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ImageUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Date;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PlayerAdventures;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PanelImageUrl;

};

// PodcastEpisodes: docs/base44_data/live/PodcastEpisode.json
USTRUCT(BlueprintType)
struct FGeodePodcastEpisodesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Duration;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString AudioUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PublishDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Description;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool IsFriday = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Title;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	int32 EpisodeNumber = 0;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// SteamTitles: docs/base44_data/live/SteamTitle.json
USTRUCT(BlueprintType)
struct FGeodeSteamTitlesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GameplayLoops;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float PriceUSD = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString AccentColor;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString MechanicalArchetype;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Title;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BuildStatus;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Storyline;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GeodeCharacters;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Tagline;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GameKey;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Category;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ArtDirection;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> SteamFeatures;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// EggHatches: docs/base44_data/elio/EggHatch.json + docs/base44_data/live/EggHatch.json
USTRUCT(BlueprintType)
struct FGeodeEggHatchesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float QuestlineSteps = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ReturnDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ContentName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float ResonanceScore = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ContentType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString HatchMonth;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString HatchDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString EggShellTier;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ImageFile;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool IsPermanent = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float SignatureThreshold = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SourceType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float SignatureCount = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Status;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ContentDescription;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float VoteCount = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// BoardSkins: docs/base44_data/elio/BoardSkin.json
USTRUCT(BlueprintType)
struct FGeodeBoardSkinsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float GrainDirection = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Rarity;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ResonanceNote;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ShadowColor;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedBy;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UnlockCondition;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString HighlightColor;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool IsDefault = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString TextureStyle;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BaseColor;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UnlockZone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString MaterialType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// TrayTemplates: docs/base44_data/elio/TrayTemplate.json
USTRUCT(BlueprintType)
struct FGeodeTrayTemplatesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UnlockZone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DipSize;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedBy;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool IsDefault = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float DipCount = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SkinId;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LayoutType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UnlockCondition;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// Artisans: docs/base44_data/elio/Artisan.json + docs/base44_data/live/Artisan.json
USTRUCT(BlueprintType)
struct FGeodeArtisansRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RenewalDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SocialLinks;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Bio;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ShopName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString AssignedZone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool IsSoulsticeArtist = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SubscriptionTier;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ArtisanName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float ListingCount = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ProfileImage;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float MonthlyFee = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> FeaturedItems;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ShopUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString JoinedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SubscriptionStatus;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ArtStyleId;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	bool Featured = false;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PortraitUrl;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	int32 DisplaySlots = 0;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Zones;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ApprovedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Tier;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Status;

};

// GrainStories: docs/base44_data/elio/GrainStory.json
USTRUCT(BlueprintType)
struct FGeodeGrainStoriesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Seed;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Draft;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> PhasesCompleted;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Status;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float WordCount = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float Phase = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	float Grains = 0.f;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Base44Id;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString CreatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString UpdatedDate;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Sources;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LiveValues;

};

// ZoneItems: zone_items_all_280.json (224 items, whatever the file name says)
USTRUCT(BlueprintType)
struct FGeodeZoneItemsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Description;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ItemType;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Materials;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString InteractiveProperties;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString BasedOn;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	TArray<FString> Variants;

};

// Characters: docs/manual/03_characters_and_critters.md, 1.5 (current canon, who is ruled)
USTRUCT(BlueprintType)
struct FGeodeCharactersRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RosterGroup;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Role;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString VoiceCasting;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Status;

};

// CharacterRenames: docs/manual/03_characters_and_critters.md, 2.3 and 2.3a (rename ledger)
USTRUCT(BlueprintType)
struct FGeodeCharacterRenamesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LedgerSection;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString OldName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString NewName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Date;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Note;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString EarlyName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString NameInTheCommitLog;

};

// CritterGroups: docs/manual/03_characters_and_critters.md, 7.5 (the three named groups)
USTRUCT(BlueprintType)
struct FGeodeCritterGroupsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Section;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Group;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Who;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Notes;

};

// FoundingCast: docs/manual/03_characters_and_critters.md, 9.2 to 9.7 (founding cast, July to August)
USTRUCT(BlueprintType)
struct FGeodeFoundingCastRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Section;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DisplayName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RoleAndPlace;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString WhatTheEarlyDocumentsSet;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Status;

};

// Levels: docs/manual/02_world_and_zones.md, 6.1 (the nine levels and the half-levels)
USTRUCT(BlueprintType)
struct FGeodeLevelsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Section;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Level;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PainterLine;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Music;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString KeepersAndHosts;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Status;

};

// Rooms: docs/manual/02_world_and_zones.md, 6.2 to 6.8 (rooms by level)
USTRUCT(BlueprintType)
struct FGeodeRoomsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Level;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString ZoneRoom;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PainterLine;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Music;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Keeper;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Status;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Room;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Painter;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

};

// ZoneSections: docs/manual/02_world_and_zones.md, section 6 in full (prose as well as tables)
USTRUCT(BlueprintType)
struct FGeodeZoneSectionsRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Heading;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Markdown;

};

// CritterNotes: docs/manual/03_characters_and_critters.md, 7.5 in full
USTRUCT(BlueprintType)
struct FGeodeCritterNotesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Heading;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Markdown;

};

// ArcadeGames: docs/arcade_build_sheets/*.md (one row per build sheet)
USTRUCT(BlueprintType)
struct FGeodeArcadeGamesRow : public FTableRowBase
{
	GENERATED_BODY()

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SheetFile;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Tier;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Title;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString OriginalGameIN;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GeodeInnNameOUT;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GenreMechanic;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Zone;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString StoneReward;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString RarityTier;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Price;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LegalBasis;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString TemplateArt;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString SheetMarkdown;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GeodeInnName;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GameEffect;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString LoreConnection;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString DevelopmentStatus;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString OriginalDeveloper;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Roster;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString GameKey;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString InspiredBy;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Players;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString PlayTime;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString WinCondition;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")
	FString Reward;

};
