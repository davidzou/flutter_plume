import 'dart:ui';

/// All from https://uigradients.com/

const List gradients = const [
  GradeGrey,
  PiggyPink,
  CoolBlues,
  MegaTron,
  MoonlitAsteroid,
  JShine,
  EveningSunshine,
  DarkOcean,
  CoolSky,
  Yoda,
  Memariani,
  Amin,
  Harvey,
  Neuromancer,
  AzurLane,
  WitchingHour,
  Flare,
  Metapolis,
  KyooPal,
  KyeMeh,
  KyooTah,
  ByDesign,
  UltraVoilet,
  BurningOrange,
  Wiretap,
  SummerDog,
  Rastafari,
  SinCityRed,
  CitrusPeel,
  BlueRaspberry,
  Margo,
  Magic,
  EveningNight,
  Vanusa,
  Shifty,
  eXpresso,
  SlightOceanView,
  PureLust,
  MoonPurple,
  RedSunset,
  Shifter,
  WeddingDayBlues,
  SandToBlue,
  Quepal,
  PunYeta,
  SublimeLight,
  Bighead,
  TaranTado,
  RelaxingRed,
  Lawrencium,
  Ohhappiness,
  Delicate,
  Selenium,
  Sulphur,
  PinkFlavour,
  RainbowBlue,
  OrangeFun,
  DigitalWater,
  Lithium,
  Argon,
  Hydrogen,
  Zinc,
  VelvetSun,
  KingYna,
  Summer,
  OrangeCoral,
  Purpink,
  Dull,
  KimobyIsTheNewBlue,
  BrokenHearts,
  Subu,
  Socialive,
  CrimsonTide,
  Telegram,
  Terminal,
  Scooter,
  Alive,
  Relay,
  Meridian,
  CompareNow,
  Mello,
  CrystalClear,
  VisionsOfGrandeur,
  ChittyChittyBangBang,
  BlueSkies,
  Sunkist,
  Coal,
  Html,
  Cinnamint,
  Maldives,
  Mini,
  Shalala,
  Purplepine,
  Celestial,
  LeaningAndLeading,
  PacificDream,
  Venice,
  Orca,
  LoveAndLiberty,
  VeryBlue,
  CanYouFeelTheLoveTonight,
  TheBlueLagoon,
  UnderTheLake,
  HoneyDew,
  Roseanna,
  WhatLiesBeyond,
  RoseColoredLenses,
  EasyMed,
  CocoaaIce,
  Jodhpur,
  Jaipur,
  ViceCity,
  Mild,
  Dawn,
  IbizaSunset,
  Radar,
  EightiesPurple,
  BlackRose,
  BradyBradyFunFun,
  EdsSunsetGradient,
  Snapchat,
  CosmicFusion,
  Nepal,
  AzurePop,
  LoveCouple,
  Disco,
  Limeade,
  Dania,
  fiftiesShadesOfGrey,
  Jupiter,
  IIITDelhi,
  SunOnTheHorizon,
  BloodRed,
  Sherbert,
  Firewatch,
  Lush,
  Frost,
  Mauve,
  Royal,
  MinimalRed,
  Dusk,
  DeepSeaSpace,
  GrapefruitSunset,
  Sunset,
  SolidVault,
  BrightVault,
  Politics,
  SweetMorning,
  Sylvia,
  Transfile,
  Tranquil,
  RedOcean,
  Shahabi,
  Alihossein,
  Ali,
  PurpleWhite,
  ColorsOfSky,
  Decent,
  DeepSpace,
  DarkSkies,
  Suzy,
  Superman,
  Nighthawk,
  Forest,
  MiamiDolphins,
  MinnesotaVikings,
  Christmas,
  Joomla,
  Pizelex,
  Haikus,
  PaleWood,
  Purplin,
  Inbox,
  Blush,
  BackToTheFuture,
  Pancho,
  GreenAndBlue,
  LightOrange,
  Netflix,
  LittleLeaf,
  DeepPurple,
  BackToEarth,
  MasterCard,
  ClearSky,
  Passion,
  Timber,
  BetweenNightAndDay,
  SagePersuasion,
  Lizard,
  Piglet,
  DarkKnight,
  CuriosityBlue,
  Ukraine,
  GreenToDark,
  FreshTurboscent,
  KokoCaramel,
  VirginAmerica,
  Portrait,
  TurquoiseFlow,
  Vine,
  Flickr,
  Instagram,
  Atlas,
  Twitch,
  PastelOrangeAtTheSun,
  EndlessRiver,
  Predawn,
  PurpleBliss,
  TalkingToMiceElf,
  Hersheys,
  CrazyOrangeI,
  BetweenTheClouds,
  MetallicToad,
  Martini,
  Friday,
  ServQuick,
  Behongo,
  SoundCloud,
  FacebookMessenger,
  Shore,
  CheerUpEmoKid,
  Amethyst,
  ManOfSteel,
  NeonLife,
  TealLove,
  RedMist,
  Starfall,
  DanceToForget,
  ParkLife,
  CherryBlossoms,
  Ash,
  Virgin,
  Earthly,
  DirtyFog,
  TheStrain,
  Reef,
  Candy,
  Autumn,
  Nelson,
  Winter,
  ForeverLost,
  Almost,
  Moor,
  Aqualicious,
  MistyMeadow,
  Kyoto,
  SiriusTamed,
  Jonquil,
  Petrichor,
  ALostMemory,
  Vasily,
  BlurryBeach,
  Namn,
  DayTripper,
  PinotNoir,
  Miaka,
  Army,
  Shrimpy,
  Influenza,
  CalmDarya,
  Bourbon,
  Stellar,
  Clouds,
  Moonrise,
  Peach,
  Dracula,
  Mantle,
  Titanium,
  Opa,
  SeaBlizz,
  MidnightCity,
  Mystic,
  ShroomHaze,
  Moss,
  BoraBora,
  VeniceBlue,
  ElectricViolet,
  Kashmir,
  SteelGray,
  Mirage,
  JuicyOrange,
  Mojito,
  Cherry,
  Pinky,
  SeaWeed,
  Stripe,
  PurpleParadise,
  Sunrise,
  AquaMarine,
  Aubergine,
  BloodyMary,
  MangoPulp,
  Frozen,
  RoseWater,
  Horizon,
  MonteCarlo,
  LemonTwist,
  EmeraldWater,
  IntuitivePurple,
  GreenBeach,
  PlayingWithReds,
  HarmonicEnergy,
  CoolBrown,
  YouTube,
  NoonToDusk,
  Hazel,
  Nimvelo,
  SeaBlue,
  Booker20,
  SexyBlue,
  PurpleLove,
  DIMIGO,
  Skyline,
  Sel,
  Sky,
  Petrol,
  Anamnisar,
  Copper,
  RoyalBlueWithPetrol,
  RoyalBlue,
  Windy,
  Rea,
  Bupe,
  Mango,
  Reaqua,
  Lunada,
  BlueLagoo,
  Anwar,
  Combi,
  VerBlack,
  Ver,
  Blu,
];

// 渐变配色

const List<Color> GradeGrey = const <Color>[const Color(0xffbdc3c7), const Color(0xff2c3e50)];
const List<Color> PiggyPink = const <Color>[const Color(0xffee9ca7), const Color(0xffffdde1)];
const List<Color> CoolBlues = const <Color>[Color(0xff2193b0), Color(0xff6dd5ed)];
const List<Color> MegaTron = const <Color>[Color(0xffc6ffdd), Color(0xfffbd786), Color(0xfff7797d)];
const List<Color> MoonlitAsteroid = const <Color>[Color(0xff0f2027), Color(0xff203a43), Color(0xff2c5364)];
const List<Color> JShine = const <Color>[Color(0xff12c2e9), Color(0xffc471ed), Color(0xfff64f59)];
const List<Color> EveningSunshine = const <Color>[Color(0xffb92b27), Color(0xff1565c0)];
const List<Color> DarkOcean = const <Color>[Color(0xff373b44), Color(0xff4286f4)];
const List<Color> CoolSky = const <Color>[Color(0xff2980b9), Color(0xff6dd5fa), Color(0xffffffff)];
const List<Color> Yoda = const <Color>[Color(0xffff0099), Color(0xff493240)];
const List<Color> Memariani = const <Color>[Color(0xffaa4b6b), Color(0xff6b6b83), Color(0xff3b8d99)];
const List<Color> Amin = const <Color>[Color(0xff8eade2), Color(0xff4a00e0)];
const List<Color> Harvey = const <Color>[Color(0xff1f4037), Color(0xff99f2c8)];
const List<Color> Neuromancer = const <Color>[Color(0xfff953c6), Color(0xffb91d73)];
const List<Color> AzurLane = const <Color>[Color(0xff7f7fd5), Color(0xff86a8e7), Color(0xff91eae4)];
const List<Color> WitchingHour = const <Color>[Color(0xffc31432), Color(0xff240b6)];
const List<Color> Flare = const <Color>[Color(0xfff12711), Color(0xfff5af19)];
const List<Color> Metapolis = const <Color>[Color(0xff659999), Color(0xfff4791f)];
const List<Color> KyooPal = const <Color>[Color(0xffdd3e54), Color(0xff6be585)];
const List<Color> KyeMeh = const <Color>[Color(0xff8360c3), Color(0xff2ebf91)];
const List<Color> KyooTah = const <Color>[Color(0xff544a7d), Color(0xffffd452)];
const List<Color> ByDesign = const <Color>[Color(0xff009fff), Color(0xffec2f4b)];
const List<Color> UltraVoilet = const <Color>[Color(0xff654ea3), Color(0xffeaafc8)];
const List<Color> BurningOrange = const <Color>[Color(0xffff416c), Color(0xffff4b2b)];
const List<Color> Wiretap = const <Color>[Color(0xff8a2387), Color(0xffe94057), Color(0xfff27121)];
const List<Color> SummerDog = const <Color>[Color(0xffa8ff78), Color(0xff78ffd6)];
const List<Color> Rastafari = const <Color>[Color(0xff1e9600), Color(0xfffff200), Color(0xffff0000)];
const List<Color> SinCityRed = const <Color>[Color(0xffed213a), Color(0xff93291e)];
const List<Color> CitrusPeel = const <Color>[Color(0xfffdc830), Color(0xfff37335)];
const List<Color> BlueRaspberry = const <Color>[Color(0xff00b4db), Color(0xff0083b0)];
const List<Color> Margo = const <Color>[Color(0xffffefba), Color(0xffffffff)];
const List<Color> Magic = const <Color>[Color(0xff59c173), Color(0xffa17fe0), Color(0xff5d26c1)];
const List<Color> EveningNight = const <Color>[Color(0xff005aa7), Color(0xfffffde4)];
const List<Color> Vanusa = const <Color>[Color(0xffda4453), Color(0xff89216b)];
const List<Color> Shifty = const <Color>[Color(0xff636363), Color(0xffa2ab58)];
const List<Color> eXpresso = const <Color>[Color(0xffad5389), Color(0xff3c1053)];
const List<Color> SlightOceanView = const <Color>[Color(0xffa8c0ff), Color(0xff3f2b96)];
const List<Color> PureLust = const <Color>[Color(0xff333333), Color(0xffdd1818)];
const List<Color> MoonPurple = const <Color>[Color(0xff4e54c8), Color(0xff8f94fb)];
const List<Color> RedSunset = const <Color>[Color(0xff355c7d), Color(0xff6c5b7b), Color(0xffc06c84)];
const List<Color> Shifter = const <Color>[Color(0xffbc4e9c), Color(0xfff80759)];
const List<Color> WeddingDayBlues = const <Color>[Color(0xff40e0d0), Color(0xffff8c00), Color(0xffff0080)];
const List<Color> SandToBlue = const <Color>[Color(0xff3e5151), Color(0xffdecba4)];
const List<Color> Quepal = const <Color>[Color(0xff11998e), Color(0xff38ef7d)];
const List<Color> PunYeta = const <Color>[Color(0xff108dc7), Color(0xffef8e38)];
const List<Color> SublimeLight = const <Color>[Color(0xfffc5c7d), Color(0xff6a82fb)];
const List<Color> Bighead = const <Color>[Color(0xffc94b4b), Color(0xff4b134f)];
const List<Color> TaranTado = const <Color>[Color(0xff23074d), Color(0xffcc5333)];
const List<Color> RelaxingRed = const <Color>[Color(0xfffffbd5), Color(0xffb20a2c)];
const List<Color> Lawrencium = const <Color>[Color(0xff0f0c29), Color(0xff302b63), Color(0xff24243e)];
const List<Color> Ohhappiness = const <Color>[Color(0xff00b09b), Color(0xff96c93d)];
const List<Color> Delicate = const <Color>[Color(0xffd3cce3), Color(0xffe9e4f0)];
const List<Color> Selenium = const <Color>[Color(0xff3c3b3f), Color(0xff605c3c)];
const List<Color> Sulphur = const <Color>[Color(0xffcac531), Color(0xfff3f9a7)];
const List<Color> PinkFlavour = const <Color>[Color(0xff800080), Color(0xffffc0cb)];
const List<Color> RainbowBlue = const <Color>[Color(0xff00f260), Color(0xff0575e6)];
const List<Color> OrangeFun = const <Color>[Color(0xfffc4a1a), Color(0xfff7b733)];
const List<Color> DigitalWater = const <Color>[Color(0xff74ebd5), Color(0xffacb6e5)];
const List<Color> Lithium = const <Color>[Color(0xff6d6027), Color(0xffd3cbb8)];
const List<Color> Argon = const <Color>[Color(0xff03001e), Color(0xff7303c0), Color(0xffec38bc), Color(0xfffdeff9)];
const List<Color> Hydrogen = const <Color>[Color(0xff667db6), Color(0xff0082c8), Color(0xff0082c8), Color(0xff667db6)];
const List<Color> Zinc = const <Color>[Color(0xffada996), Color(0xfff2f2f2), Color(0xffdbdbdb), Color(0xffeaeaea)];
const List<Color> VelvetSun = const <Color>[Color(0xffe1eec3), Color(0xfff05053)];
const List<Color> KingYna = const <Color>[Color(0xff1a2a6c), Color(0xffb21f1f), Color(0xfffdbb2d)];
const List<Color> Summer = const <Color>[Color(0xff22c1c3), Color(0xfffdbb2d)];
const List<Color> OrangeCoral = const <Color>[Color(0xffff9966), Color(0xfffff5e62)];
const List<Color> Purpink = const <Color>[Color(0xff7f00ff), Color(0xffe100ff)];
const List<Color> Dull = const <Color>[Color(0xffc9d6ff), Color(0xffe2e2e2)];
const List<Color> KimobyIsTheNewBlue = const <Color>[Color(0xff396afc), Color(0xff2948ff)];
const List<Color> BrokenHearts = const <Color>[Color(0xffd9a7c7), Color(0xfffffcdc)];
const List<Color> Subu = const <Color>[Color(0xff0cebeb), Color(0xff20e3b2), Color(0xff29ffc6)];
const List<Color> Socialive = const <Color>[Color(0xff06beb6), Color(0xff48b1bf)];
const List<Color> CrimsonTide = const <Color>[Color(0xff642b73), Color(0xffc6426e)];
const List<Color> Telegram = const <Color>[Color(0xff1c92d2), Color(0xfff2fcfe)];
const List<Color> Terminal = const <Color>[Color(0xff000000), Color(0xff0f9b0f)];
const List<Color> Scooter = const <Color>[Color(0xff36d1dc), Color(0xff5b86e5)];
const List<Color> Alive = const <Color>[Color(0xffcb356b), Color(0xffbd3f32)];
const List<Color> Relay = const <Color>[Color(0xff3a1c71), Color(0xffd76d77), Color(0xffffaf7b)];
const List<Color> Meridian = const <Color>[Color(0xff283c86), Color(0xff45a247)];
const List<Color> CompareNow = const <Color>[Color(0xffef3b36), Color(0xffffffff)];
const List<Color> Mello = const <Color>[Color(0xffc0392b), Color(0xff8e44ad)];
const List<Color> CrystalClear = const <Color>[Color(0xff159957), Color(0xff155799)];
const List<Color> VisionsOfGrandeur = const <Color>[Color(0xff000046), Color(0xff1cb5e0)];
const List<Color> ChittyChittyBangBang = const <Color>[Color(0xff007991), Color(0xff78ffd6)];
const List<Color> BlueSkies = const <Color>[Color(0xff56ccf2), Color(0xff2f80ed)];
const List<Color> Sunkist = const <Color>[Color(0xfff2994a), Color(0xfff2c94c)];
const List<Color> Coal = const <Color>[Color(0xffeb5757), Color(0xff000000)];
const List<Color> Html = const <Color>[Color(0xffE44D26), Color(0xffF16529)];
const List<Color> Cinnamint = const <Color>[Color(0xff4AC29A), Color(0xffBDFFF3)];
const List<Color> Maldives = const <Color>[Color(0xffB2FEFA), Color(0xff0ED2F7)];
const List<Color> Mini = const <Color>[Color(0xff30E8BF), Color(0xffFF8235)];
const List<Color> Shalala = const <Color>[Color(0xffD66D75), Color(0xffE29587)];
const List<Color> Purplepine = const <Color>[Color(0xff20002c), Color(0xffcbb4d4)];
const List<Color> Celestial = const <Color>[Color(0xffC33764), Color(0xff1D2671)];
const List<Color> LeaningAndLeading = const <Color>[Color(0xffF7971E), Color(0xffFFD200)];
const List<Color> PacificDream = const <Color>[Color(0xff34e89e), Color(0xff0f3443)];
const List<Color> Venice = const <Color>[Color(0xff6190e8), Color(0xffa7bfe8)];
const List<Color> Orca = const <Color>[Color(0xff44a08d), Color(0xff093637)];
const List<Color> LoveAndLiberty = const <Color>[Color(0xff200122), Color(0xff6f0000)];
const List<Color> VeryBlue = const <Color>[Color(0xff0575e6), Color(0xff021b79)];
const List<Color> CanYouFeelTheLoveTonight = const <Color>[Color(0xff4568dc), Color(0xffb06ab3)];
const List<Color> TheBlueLagoon = const <Color>[Color(0xff43c6ac), Color(0xff191654)];
const List<Color> UnderTheLake = const <Color>[Color(0xff093028), Color(0xff237a57)];
const List<Color> HoneyDew = const <Color>[Color(0xff43c6ac), Color(0xfff8ffae)];
const List<Color> Roseanna = const <Color>[Color(0xffffafbd), Color(0xffffc3a0)];
const List<Color> WhatLiesBeyond = const <Color>[Color(0xfff0f20), Color(0xff000c40)];
const List<Color> RoseColoredLenses = const <Color>[Color(0xffe8cbc0), Color(0xff636fa4)];
const List<Color> EasyMed = const <Color>[Color(0xffdce35b), Color(0xff45b649)];
const List<Color> CocoaaIce = const <Color>[Color(0xffc0c0aa), Color(0xff1cefff)];
const List<Color> Jodhpur = const <Color>[Color(0xff9cecfb), Color(0xff65c7f7), Color(0xff0052d4)];
const List<Color> Jaipur = const <Color>[Color(0xffdbe6f6), Color(0xffc5796d)];
const List<Color> ViceCity = const <Color>[Color(0xff3494e6), Color(0xffec6ead)];
const List<Color> Mild = const <Color>[Color(0xff67b26f), Color(0xff4ca2cd)];
const List<Color> Dawn = const <Color>[Color(0xfff3904f), Color(0xff3b4371)];
const List<Color> IbizaSunset = const <Color>[Color(0xffee0979), Color(0xffff6a00)];
const List<Color> Radar = const <Color>[Color(0xffa770ef), Color(0xffcf8bf3), Color(0xfffdb99b)];
const List<Color> EightiesPurple = const <Color>[Color(0xff41295a), Color(0xff2f0743)];
const List<Color> BlackRose = const <Color>[Color(0xfff4c4f3), Color(0xfffc67fa)];
const List<Color> BradyBradyFunFun = const <Color>[Color(0xff00c3ff), Color(0xffffff1c)];
const List<Color> EdsSunsetGradient = const <Color>[Color(0xffff7e5f), Color(0xfffeb47b)];
const List<Color> Snapchat = const <Color>[Color(0xfffffc00), Color(0xffffffff)];
const List<Color> CosmicFusion = const <Color>[Color(0xffff00cc), Color(0xff333399)];
const List<Color> Nepal = const <Color>[Color(0xffde6161), Color(0xff2657eb)];
const List<Color> AzurePop = const <Color>[Color(0xffef32d9), Color(0xff89fffd)];
const List<Color> LoveCouple = const <Color>[Color(0xff3a6186), Color(0xff89253e)];
const List<Color> Disco = const <Color>[Color(0xff4ecdc4), Color(0xff556270)];
const List<Color> Limeade = const <Color>[Color(0xffa1ffce), Color(0xfffaffd1)];
const List<Color> Dania = const <Color>[Color(0xffbe93c5), Color(0xff7bc6cc)];
const List<Color> fiftiesShadesOfGrey = const <Color>[Color(0xffbdc3c7), Color(0xff2c3e50)];
const List<Color> Jupiter = const <Color>[Color(0xffffd89b), Color(0xff19547b)];
const List<Color> IIITDelhi = const <Color>[Color(0xff808080), Color(0xff3fada8)];
const List<Color> SunOnTheHorizon = const <Color>[Color(0xfffceabb), Color(0xfff8b500)];
const List<Color> BloodRed = const <Color>[Color(0xfff85032), Color(0xffe73827)];
const List<Color> Sherbert = const <Color>[Color(0xfff79d00), Color(0xff64f38c)];
const List<Color> Firewatch = const <Color>[Color(0xffcb2d3e), Color(0xffef473a)];
const List<Color> Lush = const <Color>[Color(0xff56ab2f), Color(0xffa8e063)];
const List<Color> Frost = const <Color>[Color(0xff000428), Color(0xff004e92)];
const List<Color> Mauve = const <Color>[Color(0xff42275a), Color(0xff734b6d)];
const List<Color> Royal = const <Color>[Color(0xff141e30), Color(0xff243b55)];
const List<Color> MinimalRed = const <Color>[Color(0xfff00000), Color(0xffdc281e)];
const List<Color> Dusk = const <Color>[Color(0xff2c3e50), Color(0xfffd746c)];
const List<Color> DeepSeaSpace = const <Color>[Color(0xff2c3e50), Color(0xff4ca1af)];
const List<Color> GrapefruitSunset = const <Color>[Color(0xffe96443), Color(0xff904e95)];
const List<Color> Sunset = const <Color>[Color(0xff0b486b), Color(0xfff56217)];
const List<Color> SolidVault = const <Color>[Color(0xff3a7bd5), Color(0xff3a6073)];
const List<Color> BrightVault = const <Color>[Color(0xff00d2ff), Color(0xff928dab)];
const List<Color> Politics = const <Color>[Color(0xff2196f3), Color(0xfff44336)];
const List<Color> SweetMorning = const <Color>[Color(0xffff5f6d), Color(0xffffc371)];
const List<Color> Sylvia = const <Color>[Color(0xffff4b1f), Color(0xffff9068)];
const List<Color> Transfile = const <Color>[Color(0xff16bffd), Color(0xffcb3066)];
const List<Color> Tranquil = const <Color>[Color(0xffeecda3), Color(0xffef629f)];
const List<Color> RedOcean = const <Color>[Color(0xff1d4350), Color(0xffa43931)];
const List<Color> Shahabi = const <Color>[Color(0xffa80077), Color(0xff2f0743)];
const List<Color> Alihossein = const <Color>[Color(0xfff7ff00), Color(0xffdb36a4)];
const List<Color> Ali = const <Color>[Color(0xffff4b1f), Color(0xff1fddff)];
const List<Color> PurpleWhite = const <Color>[Color(0xffba5370), Color(0xfff4e2d8)];
const List<Color> ColorsOfSky = const <Color>[Color(0xffe0eafc), Color(0xffcfdef3)];
const List<Color> Decent = const <Color>[Color(0xff4ca1af), Color(0xffc4e0e5)];
const List<Color> DeepSpace = const <Color>[Color(0xff000000), Color(0xff434343)];
const List<Color> DarkSkies = const <Color>[Color(0xff4b79a1), Color(0xff283e51)];
const List<Color> Suzy = const <Color>[Color(0xff834d9b), Color(0xffd04ed6)];
const List<Color> Superman = const <Color>[Color(0xff0099f7), Color(0xfff11712)];
const List<Color> Nighthawk = const <Color>[Color(0xff2980b9), Color(0xff2c3e50)];
const List<Color> Forest = const <Color>[Color(0xff5a3f37), Color(0xff2c7744)];
const List<Color> MiamiDolphins = const <Color>[Color(0xff4da0b0), Color(0xffd39d38)];
const List<Color> MinnesotaVikings = const <Color>[Color(0xff5614b0), Color(0xffdbd65c)];
const List<Color> Christmas = const <Color>[Color(0xff2f7336), Color(0xffaa3a38)];
const List<Color> Joomla = const <Color>[Color(0xff1e3c72), Color(0xff2a5298)];
const List<Color> Pizelex = const <Color>[Color(0xff114357), Color(0xfff29492)];
const List<Color> Haikus = const <Color>[Color(0xfffd746c), Color(0xffff9068)];
const List<Color> PaleWood = const <Color>[Color(0xffeacda3), Color(0xffd6ae7b)];
const List<Color> Purplin = const <Color>[Color(0xff6a3093), Color(0xffa044ff)];
const List<Color> Inbox = const <Color>[Color(0xff457fca), Color(0xff5691c8)];
const List<Color> Blush = const <Color>[Color(0xffb24592), Color(0xfff15f79)];
const List<Color> BackToTheFuture = const <Color>[Color(0xffc02425), Color(0xfff0cb35)];
const List<Color> Pancho = const <Color>[Color(0xff403a3e), Color(0xffbe5869)];
const List<Color> GreenAndBlue = const <Color>[Color(0xffc2e59c), Color(0xff64b3f4)];
const List<Color> LightOrange = const <Color>[Color(0xffffb75e), Color(0xffed8f03)];
const List<Color> Netflix = const <Color>[Color(0xff8e0e00), Color(0xff1f1c18)];
const List<Color> LittleLeaf = const <Color>[Color(0xff76b852), Color(0xff8dc26f)];
const List<Color> DeepPurple = const <Color>[Color(0xff673ab7), Color(0xff512da8)];
const List<Color> BackToEarth = const <Color>[Color(0xff00c9ff), Color(0xff92fe9d)];
const List<Color> MasterCard = const <Color>[Color(0xfff46b45), Color(0xffeea849)];
const List<Color> ClearSky = const <Color>[Color(0xff005c97), Color(0xff363795)];
const List<Color> Passion = const <Color>[Color(0xffe53935), Color(0xffe35d5b)];
const List<Color> Timber = const <Color>[Color(0xfffc00ff), Color(0xff00dbde)];
const List<Color> BetweenNightAndDay = const <Color>[Color(0xff2c3e50), Color(0xff3498db)];
const List<Color> SagePersuasion = const <Color>[Color(0xffccccb2), Color(0xff757519)];
const List<Color> Lizard = const <Color>[Color(0xff304352), Color(0xffd7d2cc)];
const List<Color> Piglet = const <Color>[Color(0xffee9ca7), Color(0xffffdde1)];
const List<Color> DarkKnight = const <Color>[Color(0xffba8b02), Color(0xff181818)];
const List<Color> CuriosityBlue = const <Color>[Color(0xff525252), Color(0xff3d72b4)];
const List<Color> Ukraine = const <Color>[Color(0xff004ff9), Color(0xfffff94c)];
const List<Color> GreenToDark = const <Color>[Color(0xff6a9113), Color(0xff141517)];
const List<Color> FreshTurboscent = const <Color>[Color(0xfff1f2b5), Color(0xff135058)];
const List<Color> KokoCaramel = const <Color>[Color(0xffd1913c), Color(0xffffd194)];
const List<Color> VirginAmerica = const <Color>[Color(0xff7b4397), Color(0xffdc2430)];
const List<Color> Portrait = const <Color>[Color(0xff8e9eab), Color(0xffeef2f3)];
const List<Color> TurquoiseFlow = const <Color>[Color(0xff136a8a), Color(0xff267871)];
const List<Color> Vine = const <Color>[Color(0xff00bf8f), Color(0xff001510)];
const List<Color> Flickr = const <Color>[Color(0xffff0084), Color(0xff33001b)];
const List<Color> Instagram = const <Color>[Color(0xff833ab4), Color(0xfffd1d1d), Color(0xfffcb045)];
const List<Color> Atlas = const <Color>[Color(0xfffeac5e), Color(0xffc779d0), Color(0xff4bc0c8)];
const List<Color> Twitch = const <Color>[Color(0xff6441a5), Color(0xff2a0845)];
const List<Color> PastelOrangeAtTheSun = const <Color>[Color(0xffffb347), Color(0xffffcc33)];
const List<Color> EndlessRiver = const <Color>[Color(0xff43cea2), Color(0xff185a9d)];
const List<Color> Predawn = const <Color>[Color(0xffffa17f), Color(0xff00223e)];
const List<Color> PurpleBliss = const <Color>[Color(0xff360033), Color(0xff0b8793)];
const List<Color> TalkingToMiceElf = const <Color>[Color(0xff948e99), Color(0xff2e1437)];
const List<Color> Hersheys = const <Color>[Color(0xff1e130c), Color(0xff9a8478)];
const List<Color> CrazyOrangeI = const <Color>[Color(0xffd38312), Color(0xffa83279)];
const List<Color> BetweenTheClouds = const <Color>[Color(0xff73c8a9), Color(0xff373b44)];
const List<Color> MetallicToad = const <Color>[Color(0xffabbaab), Color(0xffffffff)];
const List<Color> Martini = const <Color>[Color(0xfffdfc47), Color(0xff24fe41)];
const List<Color> Friday = const <Color>[Color(0xff83a4d4), Color(0xffb6fbff)];
const List<Color> ServQuick = const <Color>[Color(0xff485563), Color(0xff29323c)];
const List<Color> Behongo = const <Color>[Color(0xff52c234), Color(0xff061700)];
const List<Color> SoundCloud = const <Color>[Color(0xfffe8c00), Color(0xfff83600)];
const List<Color> FacebookMessenger = const <Color>[Color(0xff00c6ff), Color(0xff0072ff)];
const List<Color> Shore = const <Color>[Color(0xff70e1f5), Color(0xffffd194)];
const List<Color> CheerUpEmoKid = const <Color>[Color(0xff556270), Color(0xffff6b6b)];
const List<Color> Amethyst = const <Color>[Color(0xff9d50bb), Color(0xff6e48aa)];
const List<Color> ManOfSteel = const <Color>[Color(0xff780206), Color(0xff061161)];
const List<Color> NeonLife = const <Color>[Color(0xffb3ffab), Color(0xff12fff7)];
const List<Color> TealLove = const <Color>[Color(0xffaaffa9), Color(0xff11ffbd)];
const List<Color> RedMist = const <Color>[Color(0xff000000), Color(0xffe74c3c)];
const List<Color> Starfall = const <Color>[Color(0xfff0c27b), Color(0xff4b1248)];
const List<Color> DanceToForget = const <Color>[Color(0xffff4e50), Color(0xfff9d423)];
const List<Color> ParkLife = const <Color>[Color(0xffadd100), Color(0xff7b920a)];
const List<Color> CherryBlossoms = const <Color>[Color(0xfffbd3e9), Color(0xffbb377d)];
const List<Color> Ash = const <Color>[Color(0xff606c88), Color(0xff3f4c6b)];
const List<Color> Virgin = const <Color>[Color(0xffc9ffbf), Color(0xffffafbd)];
const List<Color> Earthly = const <Color>[Color(0xff649173), Color(0xffdbd5a4)];
const List<Color> DirtyFog = const <Color>[Color(0xffb993d6), Color(0xff8ca6db)];
const List<Color> TheStrain = const <Color>[Color(0xff870000), Color(0xff190a05)];
const List<Color> Reef = const <Color>[Color(0xff00d2ff), Color(0xff3a7bd5)];
const List<Color> Candy = const <Color>[Color(0xffd3959b), Color(0xffbfe6ba)];
const List<Color> Autumn = const <Color>[Color(0xffdad299), Color(0xffb0dab9)];
const List<Color> Nelson = const <Color>[Color(0xfff2709c), Color(0xffff9472)];
const List<Color> Winter = const <Color>[Color(0xffe6dada), Color(0xff274046)];
const List<Color> ForeverLost = const <Color>[Color(0xff5d4157), Color(0xffa8caba)];
const List<Color> Almost = const <Color>[Color(0xffddd6f3), Color(0xfffaaca8)];
const List<Color> Moor = const <Color>[Color(0xff616161), Color(0xff9bc5c3)];
const List<Color> Aqualicious = const <Color>[Color(0xff50c9c3), Color(0xff96deda)];
const List<Color> MistyMeadow = const <Color>[Color(0xff215f00), Color(0xffe4e4d9)];
const List<Color> Kyoto = const <Color>[Color(0xffc21500), Color(0xffffc500)];
const List<Color> SiriusTamed = const <Color>[Color(0xffefefbb), Color(0xffd4d3dd)];
const List<Color> Jonquil = const <Color>[Color(0xffffeeee), Color(0xffddefbb)];
const List<Color> Petrichor = const <Color>[Color(0xff666600), Color(0xff999966)];
const List<Color> ALostMemory = const <Color>[Color(0xffde6262), Color(0xffffb88c)];
const List<Color> Vasily = const <Color>[Color(0xffe9d362), Color(0xff333333)];
const List<Color> BlurryBeach = const <Color>[Color(0xffd53369), Color(0xffcbad6d)];
const List<Color> Namn = const <Color>[Color(0xffa73737), Color(0xff7a2828)];
const List<Color> DayTripper = const <Color>[Color(0xfff857a6), Color(0xffff5858)];
const List<Color> PinotNoir = const <Color>[Color(0xff4b6cb7), Color(0xff182848)];
const List<Color> Miaka = const <Color>[Color(0xfffc354c), Color(0xff0abfbc)];
const List<Color> Army = const <Color>[Color(0xff414d0b), Color(0xff727a17)];
const List<Color> Shrimpy = const <Color>[Color(0xffe43a15), Color(0xffe65245)];
const List<Color> Influenza = const <Color>[Color(0xffc04848), Color(0xff480048)];
const List<Color> CalmDarya = const <Color>[Color(0xff5f2c82), Color(0xff49a09d)];
const List<Color> Bourbon = const <Color>[Color(0xffec6f66), Color(0xfff3a183)];
const List<Color> Stellar = const <Color>[Color(0xff7474bf), Color(0xff348ac7)];
const List<Color> Clouds = const <Color>[Color(0xffece9e6), Color(0xffffffff)];
const List<Color> Moonrise = const <Color>[Color(0xffdae2f8), Color(0xffd6a4a4)];
const List<Color> Peach = const <Color>[Color(0xffed4264), Color(0xffffedbc)];
const List<Color> Dracula = const <Color>[Color(0xffdc2424), Color(0xff4a569d)];
const List<Color> Mantle = const <Color>[Color(0xff24c6dc), Color(0xff514a9d)];
const List<Color> Titanium = const <Color>[Color(0xff283048), Color(0xff859398)];
const List<Color> Opa = const <Color>[Color(0xff3d7eaa), Color(0xffffe47a)];
const List<Color> SeaBlizz = const <Color>[Color(0xff1cd8d2), Color(0xff93edc7)];
const List<Color> MidnightCity = const <Color>[Color(0xff232526), Color(0xff414345)];
const List<Color> Mystic = const <Color>[Color(0xff757f9a), Color(0xffd7dde8)];
const List<Color> ShroomHaze = const <Color>[Color(0xff5c258d), Color(0xff4389a2)];
const List<Color> Moss = const <Color>[Color(0xff134e5e), Color(0xff71b280)];
const List<Color> BoraBora = const <Color>[Color(0xff2bc0e4), Color(0xffeaecc6)];
const List<Color> VeniceBlue = const <Color>[Color(0xff085078), Color(0xff85d8ce)];
const List<Color> ElectricViolet = const <Color>[Color(0xff4776e6), Color(0xff8e54e9)];
const List<Color> Kashmir = const <Color>[Color(0xff614385), Color(0xff516395)];
const List<Color> SteelGray = const <Color>[Color(0xff1f1c2c), Color(0xff928dab)];
const List<Color> Mirage = const <Color>[Color(0xff16222a), Color(0xff3a6073)];
const List<Color> JuicyOrange = const <Color>[Color(0xffff8008), Color(0xffffc837)];
const List<Color> Mojito = const <Color>[Color(0xff1d976c), Color(0xff93f9b9)];
const List<Color> Cherry = const <Color>[Color(0xffeb3349), Color(0xfff45c43)];
const List<Color> Pinky = const <Color>[Color(0xffdd5e89), Color(0xfff7bb97)];
const List<Color> SeaWeed = const <Color>[Color(0xff4cb8c4), Color(0xff3cd3ad)];
const List<Color> Stripe = const <Color>[Color(0xff1fa2ff), Color(0xff12d8fa), Color(0xffa6ffcb)];
const List<Color> PurpleParadise = const <Color>[Color(0xff1d2b64), Color(0xfff8cdda)];
const List<Color> Sunrise = const <Color>[Color(0xffff512f), Color(0xfff09819)];
const List<Color> AquaMarine = const <Color>[Color(0xff1a2980), Color(0xff26d0ce)];
const List<Color> Aubergine = const <Color>[Color(0xffaa076b), Color(0xff61045f)];
const List<Color> BloodyMary = const <Color>[Color(0xffff512f), Color(0xffdd2476)];
const List<Color> MangoPulp = const <Color>[Color(0xfff09819), Color(0xffedde5d)];
const List<Color> Frozen = const <Color>[Color(0xff403b4a), Color(0xffe7e9bb)];
const List<Color> RoseWater = const <Color>[Color(0xffe55d87), Color(0xff5fc3e4)];
const List<Color> Horizon = const <Color>[Color(0xff003973), Color(0xffe5e5be)];
const List<Color> MonteCarlo = const <Color>[Color(0xffcc95c0), Color(0xffdbd4b4), Color(0xff7aa1d2)];
const List<Color> LemonTwist = const <Color>[Color(0xff3ca55c), Color(0xffb5ac49)];
const List<Color> EmeraldWater = const <Color>[Color(0xff348f50), Color(0xff56b4d3)];
const List<Color> IntuitivePurple = const <Color>[Color(0xffda22ff), Color(0xff9733ee)];
const List<Color> GreenBeach = const <Color>[Color(0xff02aab0), Color(0xff00cdac)];
const List<Color> PlayingWithReds = const <Color>[Color(0xffd31027), Color(0xffea384d)];
const List<Color> HarmonicEnergy = const <Color>[Color(0xff16a085), Color(0xfff4d03f)];
const List<Color> CoolBrown = const <Color>[Color(0xff603813), Color(0xffb29f94)];
const List<Color> YouTube = const <Color>[Color(0xffe52d27), Color(0xffb31217)];
const List<Color> NoonToDusk = const <Color>[Color(0xffff6e7f), Color(0xffbfe9ff)];
const List<Color> Hazel = const <Color>[Color(0xff77a1d3), Color(0xff79cbca), Color(0xffe684ae)];
const List<Color> Nimvelo = const <Color>[Color(0xff314755), Color(0xff26a0da)];
const List<Color> SeaBlue = const <Color>[Color(0xff1b5876), Color(0xff4e4376)];
const List<Color> Booker20 = const <Color>[Color(0xffe65c00), Color(0xfff9d423)];
const List<Color> SexyBlue = const <Color>[Color(0xff2193b0), Color(0xff6dd5ed)];
const List<Color> PurpleLove = const <Color>[Color(0xffcc2b5e), Color(0xff753a88)];
const List<Color> DIMIGO = const <Color>[Color(0xffec008c), Color(0xfffc6767)];
const List<Color> Skyline = const <Color>[Color(0xff1488cc), Color(0xff2b32b2)];
const List<Color> Sel = const <Color>[Color(0xff00467f), Color(0xffa5cc82)];
const List<Color> Sky = const <Color>[Color(0xff076585), Color(0xffffffff)];
const List<Color> Petrol = const <Color>[Color(0xffbbd2c5), Color(0xff536976)];
const List<Color> Anamnisar = const <Color>[Color(0xff9796f0), Color(0xfffbc7d4)];
const List<Color> Copper = const <Color>[Color(0xffb79891), Color(0xff94716b)];
const List<Color> RoyalBlueWithPetrol = const <Color>[Color(0xffbbd2c5), Color(0xff536967), Color(0xff292e49)];
const List<Color> RoyalBlue = const <Color>[Color(0xff536976), Color(0xff292e49)];
const List<Color> Windy = const <Color>[Color(0xffacb6e5), Color(0xff86fde8)];
const List<Color> Rea = const <Color>[Color(0xffffe000), Color(0xff799f0c)];
const List<Color> Bupe = const <Color>[Color(0xff00416a), Color(0xffe4e5e6)];
const List<Color> Mango = const <Color>[Color(0xffffe259), Color(0xffffa751)];
const List<Color> Reaqua = const <Color>[Color(0xff799f0c), Color(0xffacbb78)];
const List<Color> Lunada = const <Color>[Color(0xff5433ff), Color(0xff20bdff), Color(0xffa5fecb)];
const List<Color> BlueLagoo = const <Color>[Color(0xff0052d4), Color(0xff4364f7), Color(0xff6fb1fc)];
const List<Color> Anwar = const <Color>[Color(0xff334d50), Color(0xffcbcaa5)];
const List<Color> Combi = const <Color>[Color(0xff00416a), Color(0xff799f0c), Color(0xffffe000)];
const List<Color> VerBlack = const <Color>[Color(0xfff7f8f8), Color(0xffacbb78)];
const List<Color> Ver = const <Color>[Color(0xffffe000), Color(0xff799f0c)];
const List<Color> Blu = const <Color>[Color(0xff00416a), Color(0xffe4e5e6)];
