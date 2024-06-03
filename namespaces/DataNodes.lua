-- Generated at 22.04.2024 in 10:48:55

---@diagnostic disable
---@meta

---@alias SyncDataNode CBikeGameStateDataNode
---| CAutomobileCreationDataNode
---| CDynamicEntityGameStateDataNode
---| CVehicleCreationDataNode
---| CDoorCreationDataNode
---| CDoorMovementDataNode
---| CPickupCreationDataNode
---| CBoatGameStateDataNode
---| CDoorScriptGameStateDataNode
---| CPedAppearanceDataNode
---| CDoorScriptInfoDataNode
---| CVehicleDamageStatusDataNode
---| CEntityOrientationDataNode
---| CPlaneControlDataNode
---| CEntityScriptGameStateDataNode
---| CEntityScriptInfoDataNode
---| CPedComponentReservationDataNode
---| CObjectGameStateDataNode
---| CGlobalFlagsDataNode
---| CObjectSectorPosNode
---| CVehicleControlDataNode
---| CPhysicalScriptGameStateDataNode
---| CHeliControlDataNode
---| CHeliHealthDataNode
---| CPedAttachDataNode
---| CMigrationDataNode
---| CObjectCreationDataNode
---| CObjectOrientationNode
---| CVehicleComponentReservationDataNode
---| CVehicleAngVelocityDataNode
---| CPhysicalMigrationDataNode
---| CObjectScriptGameStateDataNode
---| CPedAIDataNode
---| CPhysicalAngVelocityDataNode
---| CPedCreationDataNode
---| CPedGameStateDataNode
---| CPedMovementGroupDataNode
---| CPedHealthDataNode
---| CPedMovementDataNode
---| CPedOrientationDataNode
---| CPedScriptCreationDataNode
---| CPedScriptGameStateDataNode
---| CTrainGameStateDataNode
---| CSectorPositionDataNode
---| CSubmarineGameStateDataNode
---| CPlayerSectorPosNode
---| CPedSectorPosMapNode
---| CPedSectorPosNavMeshNode
---| CPhysicalGameStateDataNode
---| CPedTaskSpecificDataNode
---| CPickupPlacementStateDataNode
---| CPedTaskTreeDataNode
---| CPhysicalAttachDataNode
---| CPhysicalScriptMigrationDataNode
---| CPlayerCameraDataNode
---| CPhysicalVelocityDataNode
---| CPickupPlacementCreationDataNode
---| CPickupSectorPosNode
---| CPlayerExtendedGameStateNode
---| CPlayerWantedAndLOSDataNode
---| CPlayerGameStateDataNode
---| CSectorDataNode
---| CSubmarineControlDataNode
---| CVehicleGameStateDataNode
---| CVehicleHealthDataNode
---| CVehicleProximityMigrationDataNode
---| CVehicleScriptGameStateDataNode
---| CVehicleSteeringDataNode
---| CVehicleTaskDataNode
---| CPickupScriptGameStateNode
---| CPlaneGameStateDataNode
---| CPhysicalHealthDataNode

---@class CBikeGameStateDataNode
---@field public onSideStand boolean
CBikeGameStateDataNode = {}

---@class CAutomobileCreationDataNode
---@field public allDoorsClosed boolean
---@field public doorsClosed boolean[] # count = 10
CAutomobileCreationDataNode = {}

---@class CDynamicEntityGameStateDataNode
---@field public InteriorProxyLoc number
---@field public loadsCollisions boolean
---@field public retained boolean
---@field public decoratorListCount number
---@field public decoratorList decEnt[] # count = 11
CDynamicEntityGameStateDataNode = {}

---@class CVehicleCreationDataNode
---@field public randomSeed number
---@field public modelHash number
---@field public status number
---@field public maxHealth number
---@field public lastDriverTime number
---@field public takeOutOfParkedCarBudget boolean
---@field public needsToBeHotwired boolean
---@field public tyresDontBurst boolean
---@field public usesVerticalFlightMode boolean
CVehicleCreationDataNode = {}

---@class CDoorCreationDataNode
---@field public ModelHash number
---@field public sectorPosX number
---@field public sectorPosY number
---@field public sectorPosZ number
---@field public scriptDoor boolean
---@field public playerWantsControl boolean
CDoorCreationDataNode = {}

---@class CDoorMovementDataNode
---@field public bHasOpenRatio boolean
---@field public fOpenRatio number
---@field public bOpening boolean
---@field public bFullyOpen boolean
---@field public bClosed boolean
CDoorMovementDataNode = {}

---@class CPickupCreationDataNode
---@field public HasPlacement boolean
---@field public Script CGameScriptObjInfo
---@field public PickupHash number
---@field public Amount number
---@field public CustomModel number
---@field public LifeTime number
---@field public Components number[] # count = 11
---@field public NumWeaponComponents number
---@field public TintIndex number
---@field public PlayerGift boolean
---@field public bHasPlayersBlockingList boolean
---@field public PlayersToBlockList number
---@field public LODdistance number
---@field public includeProjectiles boolean
CPickupCreationDataNode = {}

---@class CBoatGameStateDataNode
---@field public anchorLodDistance number
---@field public boatWreckedAction number
---@field public lockedToXY boolean
---@field public forceLowLodMode boolean
---@field public useWidestToleranceBoundingBoxTest boolean
---@field public interiorLightOn boolean
---@field public buoyancyForceMultiplier number
CBoatGameStateDataNode = {}

---@class CDoorScriptGameStateDataNode
---@field public DoorSystemState number
---@field public AutomaticDist number
---@field public AutomaticRate number
---@field public Broken boolean
---@field public BrokenFlags number
---@field public Damaged boolean
---@field public DamagedFlags number
---@field public HoldOpen boolean
CDoorScriptGameStateDataNode = {}

---@class CPedAppearanceDataNode
---@field public PhoneMode number
---@field public parachuteTintIndex number
---@field public parachutePackTintIndex number
---@field public facialClipSetId number
---@field public facialIdleAnimOverrideClipNameHash number
---@field public facialIdleAnimOverrideClipDictNameHash number
---@field public isAttachingHelmet boolean
---@field public isRemovingHelmet boolean
---@field public isWearingHelmet boolean
---@field public helmetTextureId number
---@field public helmetProp number
---@field public visorUpProp number
---@field public visorDownProp number
---@field public visorIsUp boolean
---@field public supportsVisor boolean
---@field public isVisorSwitching boolean
---@field public targetVisorState number
CPedAppearanceDataNode = {}

---@class CDoorScriptInfoDataNode
---@field public hasScriptInfo boolean
---@field public doorSystemHash number
---@field public existingScriptDoor boolean
---@field public scriptInfo CGameScriptObjInfo
CDoorScriptInfoDataNode = {}

---@class CVehicleDamageStatusDataNode
---@field public weaponImpactPointLocationCounts number[] # count = 6
---@field public frontLeftDamageLevel number
---@field public frontRightDamageLevel number
---@field public middleLeftDamageLevel number
---@field public middleRightDamageLevel number
---@field public rearLeftDamageLevel number
---@field public rearRightDamageLevel number
---@field public windowsBroken boolean[] # count = 8
---@field public armouredWindowsHealth number[] # count = 8
---@field public sirensBroken boolean[] # count = 20
---@field public lightsBroken boolean[] # count = 22
---@field public frontBumperState number
---@field public rearBumperState number
---@field public armouredPenetrationDecalsCount number[] # count = 8
---@field public hasDeformationDamage boolean
---@field public hasLightsBroken boolean
---@field public hasSirensBroken boolean
---@field public hasWindowsBroken boolean
---@field public hasBrokenBouncing boolean
---@field public weaponImpactPointLocationSet boolean
---@field public hasArmouredGlass boolean
CVehicleDamageStatusDataNode = {}

---@class CEntityOrientationDataNode
---@field public orientation Matrix34
CEntityOrientationDataNode = {}

---@class CPlaneControlDataNode
---@field public yawControl number
---@field public pitchControl number
---@field public rollControl number
---@field public throttleControl number
---@field public brake number
---@field public verticalFlightMode number
---@field public hasActiveAITask boolean
CPlaneControlDataNode = {}

---@class CEntityScriptGameStateDataNode
---@field public isFixed boolean
---@field public usesCollision boolean
---@field public disableCollisionCompletely boolean
CEntityScriptGameStateDataNode = {}

---@class CEntityScriptInfoDataNode
---@field public hasScriptInfo boolean
---@field public scriptInfo CGameScriptObjInfo
CEntityScriptInfoDataNode = {}

---@class CPedComponentReservationDataNode
---@field public numPedComponents number
---@field public componentReservations number[] # count = 32
CPedComponentReservationDataNode = {}

---@class CObjectGameStateDataNode
---@field public taskType number
---@field public taskDataSize number
---@field public brokenFlags number
---@field public taskSpecificData number[] # count = 150
---@field public objectHasExploded boolean
---@field public hasAddedPhysics boolean
---@field public visible boolean
---@field public HasBeenPickedUpByHook boolean
---@field public popTires boolean
CObjectGameStateDataNode = {}

---@class CGlobalFlagsDataNode
---@field public globalFlags number
---@field public OwnershipToken number
CGlobalFlagsDataNode = {}

---@class CObjectSectorPosNode
---@field public sectorPosX number
---@field public sectorPosY number
---@field public sectorPosZ number
---@field public UseHighPrecision boolean
CObjectSectorPosNode = {}

---@class CVehicleControlDataNode
---@field public numWheels number
---@field public throttle number
---@field public brakePedal number
---@field public topSpeedPercent number
---@field public roadNodeAddress number
---@field public kersActive boolean
---@field public bringVehicleToHalt boolean
---@field public BVTHStoppingDist number
---@field public BVTHControlVertVel boolean
---@field public bModifiedLowriderSuspension boolean
---@field public bAllLowriderHydraulicsRaised boolean
---@field public fLowriderSuspension number[] # count = 10
---@field public bPlayHydraulicsBounceSound boolean
---@field public bPlayHydraulicsActivationSound boolean
---@field public bPlayHydraulicsDeactivationSound boolean
---@field public reducedSuspensionForce boolean
---@field public bIsClosingAnyDoor boolean
---@field public HasTopSpeedPercentage boolean
---@field public HasTargetGravityScale boolean
---@field public TargetGravityScale number
---@field public StickY number
---@field public isInBurnout boolean
---@field public isSubCar boolean
---@field public subCarYaw number
---@field public SubCarPitch number
---@field public SubCarDive number
---@field public bNitrousActive boolean
---@field public bIsNitrousOverrideActive boolean
CVehicleControlDataNode = {}

---@class CPhysicalScriptGameStateDataNode
---@field public RelGroupHash number
---@field public AlwaysClonedForPlayer number
---@field public HasMaxSpeed boolean
---@field public AllowMigrateToSpectator boolean
---@field public MaxSpeed number
CPhysicalScriptGameStateDataNode = {}

---@class CHeliControlDataNode
---@field public yawControl number
---@field public pitchControl number
---@field public rollControl number
---@field public throttleControl number
---@field public mainRotorStopped boolean
---@field public landingGearState number
---@field public bHasLandingGear boolean
---@field public hasActiveAITask boolean
---@field public hasJetpackStrafeForceScale boolean
---@field public jetPackStrafeForceScale number
---@field public jetPackThrusterThrottle number
---@field public lockedToXY boolean
CHeliControlDataNode = {}

---@class CHeliHealthDataNode
---@field public mainRotorHealth number
---@field public rearRotorHealth number
---@field public canBoomBreak boolean
---@field public boomBroken boolean
---@field public hasCustomHealth boolean
---@field public disableExpFromBodyDamage boolean
---@field public bodyHealth number
---@field public gasTankHealth number
---@field public engineHealth number
---@field public mainRotorDamageScale number
---@field public rearRotorDamageScale number
---@field public tailBoomDamageScale number
CHeliHealthDataNode = {}

---@class CPedAttachDataNode
---@field public X number
---@field public Y number
---@field public Z number
---@field public QX number
---@field public QY number
---@field public QZ number
---@field public AttachedTo number
---@field public AttachBone number
---@field public AttachmentFlags number
---@field public Heading1 number
---@field public Heading2 number
---@field public Attached boolean
---@field public AttachedToGround boolean
CPedAttachDataNode = {}

---@class CMigrationDataNode
---@field public clonedState number
---@field public clonedPlayersThatLeft number
---@field public unsyncedNodes number
CMigrationDataNode = {}

---@class CObjectCreationDataNode
---@field public fragParentVehicle number
---@field public objectMatrix Matrix34
---@field public dummyPosition Vector3
---@field public objectPosition Vector3
---@field public ScriptGrabPosition Vector3
---@field public ScriptGrabRadius number
---@field public ownedBy number
---@field public modelHash number
---@field public fragGroupIndex number
---@field public ownershipToken number
---@field public lodDistance number
---@field public noReassign boolean
---@field public hasGameObject boolean
---@field public playerWantsControl boolean
---@field public hasInitPhysics boolean
---@field public ScriptGrabbedFromWorld boolean
---@field public IsFragObject boolean
---@field public IsBroken boolean
---@field public IsAmbientFence boolean
---@field public HasExploded boolean
---@field public KeepRegistered boolean
---@field public DestroyFrags boolean
---@field public lodOrphanHd boolean
---@field public CanBlendWhenFixed boolean
CObjectCreationDataNode = {}

---@class CObjectOrientationNode
---@field public orientation Matrix34
---@field public bUseHighPrecision boolean
CObjectOrientationNode = {}

---@class CVehicleComponentReservationDataNode
---@field public hasReservations boolean
---@field public numVehicleComponents number
---@field public componentReservations number[] # count = 32
CVehicleComponentReservationDataNode = {}

---@class CVehicleAngVelocityDataNode
---@field public IsSuperDummyAngVel boolean
CVehicleAngVelocityDataNode = {}

---@class CPhysicalMigrationDataNode
---@field public isDead boolean
CPhysicalMigrationDataNode = {}

---@class CObjectScriptGameStateDataNode
---@field public TranslationDamping Vector3
---@field public OwnedBy number
---@field public ScopeDistance number
---@field public TintIndex number
---@field public DamageInflictorId number
---@field public objSpeedBoost number
---@field public jointToDriveIndex number
---@field public IsStealable boolean
---@field public ActivatePhysicsAsSoonAsUnfrozen boolean
---@field public UseHighPrecisionBlending boolean
---@field public UsingScriptedPhysicsParams boolean
---@field public BreakingDisabled boolean
---@field public DamageDisabled boolean
---@field public IgnoreLightSettings boolean
---@field public CanBeTargeted boolean
---@field public bDriveToMaxAngle boolean
---@field public bDriveToMinAngle boolean
---@field public bWeaponImpactsApplyGreaterForce boolean
---@field public bIsArticulatedProp boolean
---@field public bIsArenaBall boolean
---@field public bNoGravity boolean
---@field public bObjectDamaged boolean
---@field public bObjectFragBroken boolean
CObjectScriptGameStateDataNode = {}

---@class CPedAIDataNode
---@field public relationshipGroup number
---@field public decisionMakerType number
CPedAIDataNode = {}

---@class CPhysicalAngVelocityDataNode
---@field public packedAngVelocityX number
---@field public packedAngVelocityY number
---@field public packedAngVelocityZ number
CPhysicalAngVelocityDataNode = {}

---@class CPedCreationDataNode
---@field public popType number
---@field public modelHash number
---@field public randomSeed number
---@field public maxHealth number
---@field public inVehicle boolean
---@field public vehicleID number
---@field public seat number
---@field public hasProp boolean
---@field public propHash number
---@field public isStanding boolean
---@field public IsRespawnObjId boolean
---@field public RespawnFlaggedForRemoval boolean
---@field public hasAttDamageToPlayer boolean
---@field public attDamageToPlayer number
---@field public wearingAHelmet boolean
---@field public voiceHash number
CPedCreationDataNode = {}

---@class CPedGameStateDataNode
---@field public weaponComponentsTint number[] # count = 12
---@field public weaponComponents number[] # count = 12
---@field public equippedGadgets number[] # count = 3
---@field public HearingRange number
---@field public SeeingRange number
---@field public SeeingRangePeripheral number
---@field public CentreOfGazeMaxAngle number
---@field public VisualFieldMinAzimuthAngle number
---@field public VisualFieldMaxAzimuthAngle number
---@field public bIsHighlyPerceptive boolean
---@field public arrestState number
---@field public deathState number
---@field public weapon number
---@field public numWeaponComponents number
---@field public numGadgets number
---@field public seat number
---@field public nMovementModeOverrideID number
---@field public LookAtFlags number
---@field public vehicleID number
---@field public mountID number
---@field public custodianID number
---@field public LookAt number
---@field public weaponObjectTintIndex number
---@field public vehicleweaponindex number
---@field public cleardamagecount number
---@field public isHandcuffed boolean
---@field public canPerformArrest boolean
---@field public canPerformUncuff boolean
---@field public canBeArrested boolean
---@field public isInCustody boolean
---@field public keepTasksAfterCleanup boolean
---@field public weaponObjectExists boolean
---@field public weaponObjectVisible boolean
---@field public weaponObjectHasAmmo boolean
---@field public weaponObjectAttachLeft boolean
---@field public doingWeaponSwap boolean
---@field public inVehicle boolean
---@field public hasVehicle boolean
---@field public onMount boolean
---@field public hasCustodianOrArrestFlags boolean
---@field public bvehicleweaponindex boolean
---@field public bActionModeEnabled boolean
---@field public bStealthModeEnabled boolean
---@field public flashLightOn boolean
---@field public killedByStealth boolean
---@field public killedByTakedown boolean
---@field public killedByKnockdown boolean
---@field public killedByStandardMelee boolean
---@field public bPedPerceptionModified boolean
---@field public isLookingAtObject boolean
---@field public changeToAmbientPopTypeOnMigration boolean
---@field public isUpright boolean
---@field public isDuckingInVehicle boolean
---@field public isUsingLowriderLeanAnims boolean
---@field public isUsingAlternateLowriderLeanAnims boolean
---@field public HasValidWeaponClipset boolean
---@field public createdByConcealedPlayer boolean
---@field public dontBehaveLikeLaw boolean
---@field public hitByTranqWeapon boolean
---@field public permanentlyDisablePotentialToBeWalkedIntoResponse boolean
---@field public dontActivateRagdollFromAnyPedImpact boolean
---@field public hasDroppedWeapon boolean
---@field public canBeIncapacitated boolean
---@field public bDisableStartEngine boolean
---@field public disableBlindFiringInShotReactions boolean
CPedGameStateDataNode = {}

---@class CPedMovementGroupDataNode
---@field public motionInVehiclePitch number
---@field public moveBlendType number
---@field public moveBlendState number
---@field public motionSetId number
---@field public overriddenWeaponSetId number
---@field public overriddenStrafeSetId number
---@field public isCrouching boolean
---@field public isStealthy boolean
---@field public isStrafing boolean
---@field public isRagdolling boolean
---@field public isRagdollConstraintAnkleActive boolean
---@field public isRagdollConstraintWristActive boolean
CPedMovementGroupDataNode = {}

---@class CPedHealthDataNode
---@field public scriptMaxHealth number
---@field public health number
---@field public armour number
---@field public endurance number
---@field public scriptMaxEndurance number
---@field public weaponDamageHash number
---@field public hurtEndTime number
---@field public weaponDamageComponent number
---@field public weaponDamageEntity number
---@field public hasMaxHealth boolean
---@field public hasDefaultArmour boolean
---@field public hasMaxEndurance boolean
---@field public killedWithHeadShot boolean
---@field public killedWithMeleeDamage boolean
---@field public hurtStarted boolean
---@field public maxHealthSetByScript boolean
---@field public maxEnduranceSetByScript boolean
CPedHealthDataNode = {}

---@class CPedMovementDataNode
---@field public HasDesiredMoveBlendRatioX boolean
---@field public HasDesiredMoveBlendRatioY boolean
---@field public HasStopped boolean
---@field public DesiredMoveBlendRatioX number
---@field public DesiredMoveBlendRatioY number
---@field public DesiredPitch number
---@field public MaxMoveBlendRatio number
CPedMovementDataNode = {}

---@class CPedOrientationDataNode
---@field public currentHeading number
---@field public desiredHeading number
CPedOrientationDataNode = {}

---@class CPedScriptCreationDataNode
---@field public StayInCarWhenJacked boolean
CPedScriptCreationDataNode = {}

---@class CPedScriptGameStateDataNode
---@field public targetLossResponse number
---@field public fleeBehaviorFlags number
---@field public NavCapabilityFlags number
---@field public popType number
---@field public pedType number
---@field public shootRate number
---@field public pedCash number
---@field public minOnGroundTimeForStun number
---@field public ragdollBlockingFlags number
---@field public ammoToDrop number
---@field public inVehicleContextHash number
---@field public DefensiveAreaCentre Vector3
---@field public DefensiveAreaRadius number
---@field public AngledDefensiveAreaV1 Vector3
---@field public AngledDefensiveAreaV2 Vector3
---@field public AngledDefensiveAreaWidth number
---@field public fMaxInformFriendDistance number
---@field public fTimeBetweenAggressiveMovesDuringVehicleChase number
---@field public fMaxVehicleTurretFiringRange number
---@field public fAccuracy number
---@field public fMaxShootingDistance number
---@field public fBurstDurationInCover number
---@field public fTimeBetweenBurstsInCover number
---@field public fTimeBetweenPeeks number
---@field public fBlindFireChance number
---@field public fStrafeWhenMovingChance number
---@field public fWeaponDamageModifier number
---@field public fHomingRocketBreakLockAngle number
---@field public fHomingRocketBreakLockAngleClose number
---@field public fHomingRocketBreakLockCloseDistance number
---@field public fUnk1 number
---@field public vehicleweaponindex number
---@field public SeatIndexToUseInAGroup number
---@field public isTargettableByTeam number
---@field public combatMovement number
---@field public pedHasCash boolean
---@field public HasDefensiveArea boolean
---@field public DefensiveAreaType number
---@field public UseCentreAsGotoPos boolean
---@field public hasPedType boolean
---@field public isPainAudioDisabled boolean
---@field public isAmbientSpeechDisabled boolean
---@field public HasInVehicleContextHash boolean
---@field public uMaxNumFriendsToInform number
---@field public FiringPatternHash number
CPedScriptGameStateDataNode = {}

---@class CTrainGameStateDataNode
---@field public IsEngine boolean
---@field public AllowRemovalByPopulation boolean
---@field public IsCaboose boolean
---@field public IsMissionTrain boolean
---@field public Direction boolean
---@field public HasPassengerCarriages boolean
---@field public RenderDerailed boolean
---@field public StopForStations boolean
---@field public EngineCarriage number
---@field public TrainConfigIndex number
---@field public CarriageConfigIndex number
---@field public TrackId number
---@field public EngineOffset number
---@field public CruiseSpeed number
---@field public ConnectedCarriage number
---@field public ConnectedToCarriage number
---@field public TrainState number
---@field public ForceDoorsOpen boolean
---@field public UseHighPrecisionBlending boolean
CTrainGameStateDataNode = {}

---@class CSectorPositionDataNode
---@field public sectorPosX number
---@field public sectorPosY number
---@field public sectorPosZ number
CSectorPositionDataNode = {}

---@class CSubmarineGameStateDataNode
---@field public IsAnchored boolean
CSubmarineGameStateDataNode = {}

---@class CPlayerSectorPosNode
---@field public sectorPosX number
---@field public sectorPosY number
---@field public sectorPosZ number
---@field public IsStandingOnNetworkObject boolean
---@field public IsRagdolling boolean
---@field public IsOnStairs boolean
---@field public StandingOnNetworkObjectID number
---@field public LocalOffset Vector3
---@field public StealthNoise number
---@field public PackedStealthNoise number
CPlayerSectorPosNode = {}

---@class CPedSectorPosMapNode
---@field public IsRagdolling boolean
---@field public IsStandingOnNetworkObject boolean
---@field public StandingOnNetworkObjectID number
---@field public LocalOffset Vector3
CPedSectorPosMapNode = {}

---@class CPedSectorPosNavMeshNode
---@field public sectorPosX number
---@field public sectorPosY number
---@field public sectorPosZ number
CPedSectorPosNavMeshNode = {}

---@class CPhysicalGameStateDataNode
---@field public isVisible boolean
---@field public renderScorched boolean
---@field public isInWater boolean
---@field public alteringAlpha boolean
---@field public fadingOut boolean
---@field public alphaType number
---@field public customFadeDuration number
---@field public allowCloningWhileInTutorial boolean
CPhysicalGameStateDataNode = {}

---@class CPedTaskSpecificDataNode
---@field public taskIndex number
---@field public taskData CTaskData
CPedTaskSpecificDataNode = {}

---@class CPickupPlacementStateDataNode
---@field public collected boolean
---@field public destroyed boolean
---@field public collector number
---@field public regenerates boolean
---@field public regenerationTime number
CPickupPlacementStateDataNode = {}

---@class CPedTaskTreeDataNode
---@field public taskTreeData TaskSlotData[] # count = 8
---@field public taskSlotsUsed number
---@field public scriptCommand number
---@field public taskStage number
CPedTaskTreeDataNode = {}

---@class CPhysicalAttachDataNode
---@field public attached boolean
---@field public attachedObjectID number
---@field public attachmentOffsetX number
---@field public attachmentOffsetY number
---@field public attachmentOffsetZ number
---@field public attachmentQuatX number
---@field public attachmentQuatY number
---@field public attachmentQuatZ number
---@field public attachmentParentOffsetX number
---@field public attachmentParentOffsetY number
---@field public attachmentParentOffsetZ number
---@field public attachmentOtherBone number
---@field public attachmentMyBone number
---@field public attachmentFlags number
---@field public allowInitialSeparation boolean
---@field public InvMassScaleA number
---@field public InvMassScaleB number
---@field public activatePhysicsWhenDetached boolean
---@field public syncPhysicsActivation boolean
---@field public IsCargoVehicle boolean
CPhysicalAttachDataNode = {}

---@class CPhysicalScriptMigrationDataNode
---@field public HasData boolean
---@field public ScriptParticipants number
---@field public HostToken number
CPhysicalScriptMigrationDataNode = {}

---@class CPlayerCameraDataNode
---@field public Position Vector3
---@field public playerToTargetAimOffset Vector3
---@field public lockOnTargetOffset Vector3
---@field public LookAtPosition Vector3
---@field public CameraX number
---@field public CameraZ number
---@field public targetId number
---@field public UsingFreeCamera boolean
---@field public UsingCinematicVehCamera boolean
---@field public morePrecision boolean
---@field public largeOffset boolean
---@field public aiming boolean
---@field public longRange boolean
---@field public freeAimLockedOnTarget boolean
---@field public canOwnerMoveWhileAiming boolean
---@field public UsingLeftTriggerAimMode boolean
---@field public isLooking boolean
---@field public bAimTargetEntity boolean
---@field public usingFirstPersonCamera boolean
---@field public usingFirstPersonVehicleCamera boolean
---@field public inFirstPersonIdle boolean
---@field public stickWithinStrafeAngle boolean
---@field public usingSwimMotionTask boolean
---@field public onSlope boolean
CPlayerCameraDataNode = {}

---@class CPhysicalVelocityDataNode
---@field public packedVelocityX number
---@field public packedVelocityY number
---@field public packedVelocityZ number
CPhysicalVelocityDataNode = {}

---@class CPickupPlacementCreationDataNode
---@field public mapPlacement boolean
---@field public pickupPositionX number
---@field public pickupPositionY number
---@field public pickupPositionZ number
---@field public pickupOrientationX number
---@field public pickupOrientationY number
---@field public pickupOrientationZ number
---@field public pickupHash number
---@field public placementFlags number
---@field public amount number
---@field public customModelHash number
---@field public customRegenTime number
---@field public teamPermits number
---@field public scriptObjInfo CGameScriptObjInfo
CPickupPlacementCreationDataNode = {}

---@class CPickupSectorPosNode
---@field public sectorPosX number
---@field public sectorPosY number
---@field public sectorPosZ number
CPickupSectorPosNode = {}

---@class CPlayerExtendedGameStateNode
---@field public fxWaypoint number
---@field public fyWaypoint number
---@field public WaypointObjectId number
---@field public bHasActiveWaypoint boolean
---@field public bOwnsWaypoint boolean
---@field public WaypointLocalDirtyTimestamp number
---@field public CityDensity number
---@field public fovRatio number
---@field public aspectRatio number
---@field public MaxExplosionDamage number
---@field public ghostPlayers number
CPlayerExtendedGameStateNode = {}

---@class CPlayerWantedAndLOSDataNode
---@field public lastSpottedLocation Vector3
---@field public searchAreaCentre Vector3
---@field public wantedLevel number
---@field public WantedLevelBeforeParole number
---@field public timeLastSpotted number
---@field public visiblePlayers number
---@field public timeFirstSpotted number
---@field public fakeWantedLevel number
---@field public HasLeftInitialSearchArea boolean
---@field public copsAreSearching boolean
---@field public causedByThisPlayer boolean
---@field public bIsOutsideCircle boolean
---@field public causedByPlayerPhysicalIndex number
CPlayerWantedAndLOSDataNode = {}

---@class CPlayerGameStateDataNode
---@field public PlayerState number
---@field public MobileRingState number
---@field public PlayerTeam number
---@field public AirDragMult number
---@field public MaxHealth number
---@field public MaxArmour number
---@field public JackSpeed number
---@field public IsTargettableByTeam number
---@field public OverrideReceiveChat number
---@field public OverrideSendChat number
---@field public bOverrideTutorialChat boolean
---@field public bOverrideTransitionChat boolean
---@field public bIsSCTVSpectating boolean
---@field public SpectatorId number
---@field public AntagonisticPlayerIndex number
---@field public TutorialIndex number
---@field public TutorialInstanceID number
---@field public fVoiceLoudness number
---@field public nVoiceChannel number
---@field public bHasVoiceProximityOverride boolean
---@field public vVoiceProximityOverride Vector3
---@field public sizeOfNetArrayData number
---@field public vehicleweaponindex number
---@field public bvehicleweaponindex boolean
---@field public decoratorListCount number
---@field public decoratorList decEnt[] # count = 3
---@field public bIsFriendlyFireAllowed boolean
---@field public bIsPassiveMode boolean
---@field public GarageInstanceIndex number
---@field public nPropertyID number
---@field public nMentalState number
---@field public nPedDensity number
---@field public bBattleAware boolean
---@field public VehicleJumpDown boolean
---@field public WeaponDefenseModifier number
---@field public WeaponMinigunDefenseModifier number
---@field public bUseExtendedPopulationRange boolean
---@field public vExtendedPopulationRangeCenter Vector3
---@field public nCharacterRank number
---@field public FadeOut boolean
---@field public bDisableLeavePedBehind boolean
---@field public bCollisionsDisabledByScript boolean
---@field public bInCutscene boolean
---@field public bGhost boolean
---@field public bIsSuperJump boolean
---@field public EnableCrewEmblem boolean
---@field public ConcealedOnOwner boolean
---@field public LockOnTargetID number
---@field public LockOnState number
---@field public VehicleShareMultiplier number
---@field public WeaponDamageModifier number
---@field public MeleeDamageModifier number
---@field public MeleeUnarmedDamageModifier number
---@field public bHasScriptedWeaponFirePos boolean
---@field public ScriptedWeaponFirePos Vector3
---@field public arcadeTeamInt number
---@field public arcadeRoleInt number
---@field public arcadeCNCVOffender boolean
---@field public arcadePassiveAbilityFlags number
---@field public bIsShockedFromDOTEffect boolean
---@field public bIsChokingFromDOTEffect boolean
CPlayerGameStateDataNode = {}

---@class CSectorDataNode
---@field public sectorX number
---@field public sectorY number
---@field public sectorZ number
CSectorDataNode = {}

---@class CSubmarineControlDataNode
---@field public yaw number
---@field public pitch number
---@field public dive number
CSubmarineControlDataNode = {}

---@class CVehicleGameStateDataNode
---@field public HeadlightMultiplier number
---@field public customPathNodeStreamingRadius number
---@field public downforceModifierFront number
---@field public downforceModifierRear number
---@field public radioStation number
---@field public doorLockState number
---@field public doorsBroken number
---@field public doorsNotAllowedToBeBrokenOff number
---@field public windowsDown number
---@field public timedExplosionTime number
---@field public junctionArrivalTime number
---@field public OverridenVehHornHash number
---@field public fullThrottleEndTime number
---@field public timedExplosionCulprit number
---@field public exclusiveDriverPedID number[] # count = 2
---@field public lastDriverPedID number
---@field public ExtraBrokenFlags number
---@field public overridelights number
---@field public doorIndividualLockedStateFilter number
---@field public doorIndividualLockedState number[] # count = 7
---@field public junctionCommand number
---@field public doorsOpen number
---@field public doorsOpenRatio number[] # count = 7
---@field public xenonLightColor number
---@field public PlayerLocks number
---@field public engineOn boolean
---@field public engineStarting boolean
---@field public engineSkipEngineStartup boolean
---@field public handBrakeOn boolean
---@field public scriptSetHandbrakeOn boolean
---@field public sirenOn boolean
---@field public pretendOccupants boolean
---@field public useRespotEffect boolean
---@field public runningRespotTimer boolean
---@field public isDriveable boolean
---@field public alarmSet boolean
---@field public alarmActivated boolean
---@field public isStationary boolean
---@field public isParked boolean
---@field public hasTimedExplosion boolean
---@field public DontTryToEnterThisVehicleIfLockedForPlayer boolean
---@field public lightsOn boolean
---@field public headlightsFullBeamOn boolean
---@field public roofLowered boolean
---@field public removeWithEmptyCopOrWreckedVehs boolean
---@field public moveAwayFromPlayer boolean
---@field public forceOtherVehsToStop boolean
---@field public radioStationChangedByDriver boolean
---@field public noDamageFromExplosionsOwnedByDriver boolean
---@field public flaggedForCleanup boolean
---@field public ghost boolean
---@field public hasLastDriver boolean
---@field public influenceWantedLevel boolean
---@field public hasBeenOwnedByPlayer boolean
---@field public AICanUseExclusiveSeats boolean
---@field public placeOnRoadQueued boolean
---@field public planeResistToExplosion boolean
---@field public mercVeh boolean
---@field public vehicleOccupantsTakeExplosiveDamage boolean
---@field public canEjectPassengersIfLocked boolean
---@field public RemoveAggressivelyForCarjackingMission boolean
---@field public OverridingVehHorn boolean
---@field public UnFreezeWhenCleaningUp boolean
---@field public usePlayerLightSettings boolean
---@field public isTrailerAttachmentEnabled boolean
---@field public detachedTombStone boolean
---@field public fullThrottleActive boolean
---@field public driftTyres boolean
---@field public disableSuperDummy boolean
---@field public checkForEnoughRoomToFitPed boolean
CVehicleGameStateDataNode = {}

---@class CVehicleHealthDataNode
---@field public suspensionHealth number[] # count = 10
---@field public tyreWearRate number[] # count = 10
---@field public tyreDamaged boolean[] # count = 10
---@field public tyreDestroyed boolean[] # count = 10
---@field public tyreBrokenOff boolean[] # count = 10
---@field public tyreFire boolean[] # count = 10
---@field public lastDamagedMaterialId number
---@field public packedEngineHealth number
---@field public packedPetrolTankHealth number
---@field public numWheels number
---@field public tyreHealthDefault boolean
---@field public suspensionHealthDefault boolean
---@field public hasDamageEntity boolean
---@field public hasMaxHealth boolean
---@field public health number
---@field public bodyhealth number
---@field public weaponDamageHash number
---@field public weaponDamageEntity number
---@field public fixedCount number
---@field public extinguishedFireCount number
---@field public isWrecked boolean
---@field public isBlownUp boolean
---@field public healthsame boolean
CVehicleHealthDataNode = {}

---@class CVehicleProximityMigrationDataNode
---@field public maxOccupants number
---@field public hasOccupant boolean[] # count = 16
---@field public occupantID number[] # count = 16
---@field public hasPopType boolean
---@field public PopType number
---@field public status number
---@field public lastDriverTime number
---@field public isMoving boolean
---@field public position Vector3
---@field public packedVelocityX number
---@field public packedVelocityY number
---@field public packedVelocityZ number
---@field public SpeedMultiplier number
---@field public RespotCounter number
---@field public hasTaskData boolean
---@field public taskType number
---@field public taskMigrationDataSize number
---@field public taskMigrationData number[] # count = 100
CVehicleProximityMigrationDataNode = {}

---@class CVehicleScriptGameStateDataNode
---@field public PopType number
---@field public restrictedAmmoCount number[] # count = 6
---@field public TeamLocks number
---@field public TeamLockOverrides number
---@field public CollisionWithMapDamageScale number
---@field public ScriptMaxSpeed number
---@field public fScriptDamageScale number
---@field public fScriptWeaponDamageScale number
---@field public fRampImpulseScale number
---@field public fOverrideArriveDistForVehPersuitAttack number
---@field public GarageInstanceIndex number
---@field public isinair boolean
---@field public DamageThreshold number
---@field public bBlockWeaponSelection boolean
---@field public isBeastVehicle boolean
---@field public VehicleProducingSlipstream number
---@field public IsCarParachuting boolean
---@field public parachuteStickX number
---@field public parachuteStickY number
---@field public lockedToXY boolean
---@field public BuoyancyForceMultiplier number
---@field public bBoatIgnoreLandProbes boolean
---@field public rocketBoostRechargeRate number
---@field public parachute number
---@field public hasParachuteObject boolean
---@field public disableRampCarImpactDamage boolean
---@field public tuckInWheelsForQuadBike boolean
---@field public vehicleParachuteTintIndex number
---@field public hasHeliRopeLengthSet boolean
---@field public HeliRopeLength number
---@field public ExtraBoundAttachAllowance number
---@field public ScriptForceHd boolean
---@field public CanEngineMissFire boolean
---@field public DisableBreaking boolean
---@field public gliderState number
---@field public disableCollisionUponCreation boolean
---@field public disablePlayerCanStandOnTop boolean
---@field public canPickupEntitiesThatHavePickupDisabled boolean
---@field public BombAmmoCount number
---@field public CountermeasureAmmoCount number
---@field public InSubmarineMode boolean
---@field public TransformInstantly boolean
---@field public AllowSpecialFlightMode boolean
---@field public SpecialFlightModeUsed boolean
---@field public homingCanLockOnToObjects boolean
---@field public DisableVericalFlightModeTransition boolean
---@field public HasOutriggerDeployed boolean
---@field public UsingAutoPilot boolean
---@field public DisableHoverModeFlight boolean
---@field public RadioEnabledByScript boolean
---@field public bIncreaseWheelCrushDamage boolean
CVehicleScriptGameStateDataNode = {}

---@class CVehicleSteeringDataNode
---@field public steeringAngle number
CVehicleSteeringDataNode = {}

---@class CVehicleTaskDataNode
---@field public taskType number
---@field public taskDataSize number
---@field public taskData number[] # count = 256
CVehicleTaskDataNode = {}

---@class CPickupScriptGameStateNode
---@field public flags number
---@field public bFloating boolean
---@field public teamPermits number
---@field public offsetGlow number
---@field public portable boolean
---@field public inAccessible boolean
---@field public lastAccessibleLoc Vector3
---@field public lastAccessibleLocHasValidGround boolean
---@field public allowNonScriptParticipantCollect boolean
CPickupScriptGameStateNode = {}

---@class CPlaneGameStateDataNode
---@field public LandingGearPublicState number
---@field public SectionDamage number[] # count = 13
---@field public SectionDamageScale number[] # count = 13
---@field public LandingGearSectionDamageScale number[] # count = 6
---@field public DamagedSections number
---@field public BrokenSections number
---@field public RotorBroken number
---@field public LockOnTarget number
---@field public LockOnState number
---@field public IndividualPropellerFlags number
---@field public AIIgnoresBrokenPartsForHandling boolean
---@field public ControlSectionsBreakOffFromExplosions boolean
---@field public HasCustomSectionDamageScale boolean
---@field public HasCustomLandingGearSectionDamageScale boolean
---@field public EngineDamageScale number
---@field public LODdistance number
---@field public disableExpFromBodyDamage boolean
---@field public AllowRollAndYawWhenCrashing boolean
---@field public dipStraightDownWhenCrashing boolean
---@field public disableExlodeFromBodyDamageOnCollision boolean
CPlaneGameStateDataNode = {}

---@class CPhysicalHealthDataNode
---@field public hasMaxHealth boolean
---@field public maxHealthSetByScript boolean
---@field public scriptMaxHealth number
---@field public health number
---@field public weaponDamageEntity number
---@field public weaponDamageHash number
---@field public lastDamagedMaterialId number
CPhysicalHealthDataNode = {}

