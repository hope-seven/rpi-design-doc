'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "029605c0bc275e8fd19471896752d8ef",
"/": "029605c0bc275e8fd19471896752d8ef",
"manifest.json": "e399257167700621ccdd9ff3bcd19b66",
"main.dart.js": "9bda830d40ca28ea869053784d6c0010",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"flutter_bootstrap.js": "e362fb967d125e563fe23e108ceffc6f",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2ef5a459acef35275d0289f3bf90bcf8",
"assets/AssetManifest.bin": "26a164c84823b6bddd1ad76c0265842d",
"assets/AssetManifest.bin.json": "3b760a4ca7a7691c7abc100dbfa1353c",
"assets/NOTICES": "95677c8c472099bcaaee428b7980032b",
"assets/assets/prototype/events.png": "5aeb486dc07a31cce0b9d329aa720200",
"assets/assets/prototype/calendar.png": "54fd7b80909aed584cf37c0fa53ecf61",
"assets/assets/prototype/homepage.png": "9bc3e2fc65da8412e4be5cfe1604519a",
"assets/assets/prototype/about_us.png": "03eb557b1cd00c6384c0cd89ca382021",
"assets/assets/prototype/donation_money.png": "fbbac51b3324a59edb83b58edfcf8018",
"assets/assets/prototype/get_involved.png": "927dbbee44e3a6e515c4d01a706a7629",
"assets/assets/prototype/after_school.png": "a9dfd0ffbcc82e4374b75cfafa581f8e",
"assets/assets/prototype/contact_us.png": "2ede37007ca92625a0afceb2b251268d",
"assets/assets/prototype/donation_food.png": "7d840d067f59a1719062fed82e664fd4",
"assets/assets/prototype/summer_camp.png": "3bf4b6fba4bf17c88e9465b8078f956b",
"assets/assets/prototype/food_pantry.png": "72312905575ab4d800d36afffb57e4ab",
"assets/assets/avatars/jackson.jpg": "97dde76b17d7f5bbd516362232f0d12f",
"assets/assets/avatars/alyssa.jpg": "b3a4a4650c3fa7a1aeed1489eb62b4b8",
"assets/assets/avatars/andy.png": "1dec9b0a6625dc96bbd9b24ce96660c0",
"assets/assets/avatars/priyanka.png": "d43bac4166d11860ae5774ea9f7e12f6",
"assets/assets/avatars/alex.png": "a2e85118af3215f20a2047704442a5a0",
"assets/assets/avatars/tushar.jpg": "51b37ed8af5d1dff1efa95f2fd4465e8",
"assets/assets/avatars/wendy.jpg": "b16a1d7494222e3fabb4cbae32c691f7",
"assets/assets/pics/customer_survey.png": "372eb43a693d839e7e2fdf7b2454db38",
"assets/assets/pics/customer_journey.png": "8c2bba50ee2d89ae307f4c73fca93eea",
"assets/assets/pics/tree_testing.png": "182e188e806f58f1c1e3fe035398b1d4",
"assets/assets/pics/a_b_testing.png": "de9a06b4cb77f83807eff27834a59700",
"assets/assets/pics/hope-seven-logo.png": "6f1e771b4768cb4a66825c6810862098",
"assets/assets/pics/comparative_analysis.png": "47fa1156b1a148474e7227a55f0a8767",
"assets/assets/pics/gestalt_principles.png": "6b74cf7b346896567ccd4f67837eb2d2",
"assets/assets/pics/customer_voice.png": "7f07deaa6e6856f2b96da8de38a3ab0e",
"assets/assets/pics/user_persona.png": "76038ad822371abc92a079af6de9184c",
"assets/assets/pics/card_sorting.jpg": "afc0877901c854bdb729fa4a2d35905a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "509c37d1f5e6c20174cdcd4271e19516",
"version.json": "7f99094ce07dda291f6273ae266d5b48"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
