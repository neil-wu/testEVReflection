# testEVReflection
EVReflection will crash on iOS7, with xcode 7.3, swift 2.2.

This small project will show this crash.

The following is the detail backtrace:

```
(lldb) bt
* thread #1: tid = 0x9e87e, 0x002ff95e libswiftCore.dylib`swift_initClassMetadata_UniversalStrategy + 448, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=2, address=0x31a94c)
    frame #0: 0x002ff95e libswiftCore.dylib`swift_initClassMetadata_UniversalStrategy + 448
    frame #1: 0x00288710 libswiftCore.dylib`___lldb_unnamed_function317$$libswiftCore.dylib + 128
    frame #2: 0x00300d1c libswiftCore.dylib`(anonymous namespace)::GenericCacheEntry* llvm::function_ref<(anonymous namespace)::GenericCacheEntry* ()>::callback_fn<swift_getGenericMetadata::$_1>(long) + 18
    frame #3: 0x00300c0e libswiftCore.dylib`swift::MetadataCache<(anonymous namespace)::GenericCacheEntry>::addMetadataEntry(swift::EntryRef<(anonymous namespace)::GenericCacheEntry>, ConcurrentList<swift::MetadataCache<(anonymous namespace)::GenericCacheEntry>::EntryPair>&, llvm::function_ref<(anonymous namespace)::GenericCacheEntry* ()>) + 80
    frame #4: 0x002feb28 libswiftCore.dylib`swift::MetadataCache<(anonymous namespace)::GenericCacheEntry>::findOrAdd(void const* const*, unsigned long, llvm::function_ref<(anonymous namespace)::GenericCacheEntry* ()>) + 318
    frame #5: 0x002febca libswiftCore.dylib`swift_getGenericMetadata1 + 64
    frame #6: 0x00289290 libswiftCore.dylib`___lldb_unnamed_function334$$libswiftCore.dylib + 44
    frame #7: 0x00300d1c libswiftCore.dylib`(anonymous namespace)::GenericCacheEntry* llvm::function_ref<(anonymous namespace)::GenericCacheEntry* ()>::callback_fn<swift_getGenericMetadata::$_1>(long) + 18
    frame #8: 0x00300c0e libswiftCore.dylib`swift::MetadataCache<(anonymous namespace)::GenericCacheEntry>::addMetadataEntry(swift::EntryRef<(anonymous namespace)::GenericCacheEntry>, ConcurrentList<swift::MetadataCache<(anonymous namespace)::GenericCacheEntry>::EntryPair>&, llvm::function_ref<(anonymous namespace)::GenericCacheEntry* ()>) + 80
    frame #9: 0x002feb28 libswiftCore.dylib`swift::MetadataCache<(anonymous namespace)::GenericCacheEntry>::findOrAdd(void const* const*, unsigned long, llvm::function_ref<(anonymous namespace)::GenericCacheEntry* ()>) + 318
    frame #10: 0x002febca libswiftCore.dylib`swift_getGenericMetadata1 + 64
    frame #11: 0x0028898c libswiftCore.dylib`___lldb_unnamed_function321$$libswiftCore.dylib + 144
    frame #12: 0x00300d1c libswiftCore.dylib`(anonymous namespace)::GenericCacheEntry* llvm::function_ref<(anonymous namespace)::GenericCacheEntry* ()>::callback_fn<swift_getGenericMetadata::$_1>(long) + 18
    frame #13: 0x00300c0e libswiftCore.dylib`swift::MetadataCache<(anonymous namespace)::GenericCacheEntry>::addMetadataEntry(swift::EntryRef<(anonymous namespace)::GenericCacheEntry>, ConcurrentList<swift::MetadataCache<(anonymous namespace)::GenericCacheEntry>::EntryPair>&, llvm::function_ref<(anonymous namespace)::GenericCacheEntry* ()>) + 80
    frame #14: 0x002feb28 libswiftCore.dylib`swift::MetadataCache<(anonymous namespace)::GenericCacheEntry>::findOrAdd(void const* const*, unsigned long, llvm::function_ref<(anonymous namespace)::GenericCacheEntry* ()>) + 318
    frame #15: 0x002feb72 libswiftCore.dylib`swift_getGenericMetadata + 62
    frame #16: 0x002e8638 libswiftCore.dylib`type metadata accessor for Swift._CollectionBox<Swift.Mirror.LegacyChildren> + 652
    frame #17: 0x00273a48 libswiftCore.dylib`function signature specialization <Arg[3] = Dead> of Swift.Mirror.init (legacy : Swift._MirrorType, subjectType : protocol<>.Type, makeSuperclassMirror : Swift.Optional<() -> Swift.Optional<Swift.Mirror>>) -> Swift.Mirror + 1220
    frame #18: 0x0024c9ac libswiftCore.dylib`Swift.Mirror.init (reflecting : protocol<>) -> Swift.Mirror + 508
  * frame #19: 0x000b1964 testevreflection`static EVReflection.(theObject=0x15624f00, self=testevreflection.EVReflection, performKeyCleanup=false, pdict=nil, tdict=nil) -> (NSDictionary, NSDictionary)).(closure #1) + 132 at EVReflection.swift:123
    frame #20: 0x000abd3c testevreflection`partial apply for static EVReflection.(toDictionary(NSObject, performKeyCleanup : Bool) -> (NSDictionary, NSDictionary)).(closure #1) + 136 at EVReflection.swift:0
    frame #21: 0x006221fc libswiftObjectiveC.dylib`ObjectiveC.autoreleasepool (() -> ()) -> () + 40
    frame #22: 0x0009b22c testevreflection`static EVReflection.toDictionary(theObject=0x15624f00, performKeyCleanup=false, self=testevreflection.EVReflection) -> (NSDictionary, NSDictionary) + 204 at EVReflection.swift:130
    frame #23: 0x0009683c testevreflection`static EVReflection.(anyObject=<unavailable>, dictionary=2 key/value pairs, self=testevreflection.EVReflection)<A where ...> (A, dictionary : NSDictionary) -> (keyMapping : NSDictionary, properties : NSDictionary, types : NSDictionary) + 100 at EVReflection.swift:94
    frame #24: 0x000afb80 testevreflection`static EVReflection.(self=testevreflection.EVReflection, anyObject=0x000c16fc, dictionary=2 key/value pairs) -> A).(closure #1) + 144 at EVReflection.swift:49
    frame #25: 0x006221fc libswiftObjectiveC.dylib`ObjectiveC.autoreleasepool (() -> ()) -> () + 40
    frame #26: 0x000967a8 testevreflection`static EVReflection.setPropertiesfromDictionary<A where ...> (dictionary=2 key/value pairs, anyObject=0x000c16fc, self=testevreflection.EVReflection) -> A + 204 at EVReflection.swift:72
    frame #27: 0x000b8590 testevreflection`EVObject.init(json="{ \"name\": \"hello\",\"age\": 1 }") -> EVObject + 288 at EVObject.swift:53
    frame #28: 0x000b86c8 testevreflection`EVObject.__allocating_init(json : String?) -> EVObject + 148 at EVObject.swift:0
    frame #29: 0x0008e694 testevreflection`ViewController.viewDidLoad(self=0x1566a130) -> () + 272 at ViewController.swift:27
    frame #30: 0x0008e7dc testevreflection`@objc ViewController.viewDidLoad() -> () + 56 at ViewController.swift:0
    frame #31: 0x3358695a UIKit`-[UIViewController loadViewIfRequired] + 518
    frame #32: 0x33586718 UIKit`-[UIViewController view] + 24
    frame #33: 0x3358d3f0 UIKit`-[UIWindow addRootViewControllerViewIfPossible] + 64
    frame #34: 0x3358aae4 UIKit`-[UIWindow _setHidden:forced:] + 308
    frame #35: 0x335f582c UIKit`-[UIWindow makeKeyAndVisible] + 60
    frame #36: 0x335f25fc UIKit`-[UIApplication _callInitializationDelegatesForURL:payload:suspended:] + 1656
    frame #37: 0x335ecb40 UIKit`-[UIApplication _runWithURL:payload:launchOrientation:statusBarStyle:statusBarHidden:] + 720
    frame #38: 0x33587a06 UIKit`-[UIApplication handleEvent:withNewEvent:] + 3142
    frame #39: 0x33586cfc UIKit`-[UIApplication sendEvent:] + 72
    frame #40: 0x335ec320 UIKit`_UIApplicationHandleEvent + 664
    frame #41: 0x35a6c76c GraphicsServices`_PurpleEventCallback + 608
    frame #42: 0x35a6c356 GraphicsServices`PurpleEventCallback + 34
    frame #43: 0x30dc8776 CoreFoundation`__CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 34
    frame #44: 0x30dc8712 CoreFoundation`__CFRunLoopDoSource1 + 346
    frame #45: 0x30dc6ede CoreFoundation`__CFRunLoopRun + 1406
    frame #46: 0x30d31470 CoreFoundation`CFRunLoopRunSpecific + 524
    frame #47: 0x30d31252 CoreFoundation`CFRunLoopRunInMode + 106
    frame #48: 0x335eb5c2 UIKit`-[UIApplication _run] + 762
    frame #49: 0x335e6844 UIKit`UIApplicationMain + 1136
    frame #50: 0x000b7db8 testevreflection`main + 172 at AppDelegate.swift:12
    frame #51: 0x3b653ab6 libdyld.dylib`start + 2
(lldb) 
```

As you can see the first non EVReflection line is ast frame #18 where a Mirror of the object is created. The crash is within the code that is creating the Mirror. This looks like a Swift bug.
I found this issue reported at: https://bugs.swift.org/browse/SR-1036
