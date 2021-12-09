'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "cfc0fd488908d106a8ad75e150e4863c",
"assets/assets/i10n/i10n.csv": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/images/art_of_war.jpg": "2a5bf99802d48d5046bd61a22c0b4df5",
"assets/assets/images/carousel/medium01.jpg": "7a9de24af2edaf7ca5da01a81763e389",
"assets/assets/images/carousel/medium02.jpg": "9a4f12a8856f4fd0b3e22e084c820729",
"assets/assets/images/carousel/medium03.jpg": "561023094c920254b2d5902e6c760a2f",
"assets/assets/images/carousel/medium04.jpg": "21dcc6c0652ee1f4e7a5b412e7e43cdd",
"assets/assets/images/carousel/medium05.jpg": "4b176bdf94354621dc5932ae37acddc4",
"assets/assets/images/carousel/medium06.jpg": "2759f34a5c2f70f27ecba913ded4529e",
"assets/assets/images/carousel/medium07.jpg": "f179103378fe59651564bace789fe6f9",
"assets/assets/images/carousel/medium08.jpg": "56a4920fb89adcef36338299a613ce76",
"assets/assets/images/carousel/medium09.jpg": "682b3a2788511e1ff709393f9cd432cd",
"assets/assets/images/carousel/medium10.jpg": "f21926cc68b2924801a3af30612957cc",
"assets/assets/images/carousel/medium11.jpg": "d7d0030bef9a23599b510e5a17fa4eb7",
"assets/assets/images/carousel/medium12.jpg": "89be641309a0eea14185c64041a30803",
"assets/assets/images/carousel/medium13.jpg": "639761c43e959fedc7fc87442f037cb1",
"assets/assets/images/carousel/medium14.jpg": "9cabac071a5d7f352ef58897c796db46",
"assets/assets/images/carousel/medium15.jpg": "5c19852187a32c975933fd095592516b",
"assets/assets/images/carousel/medium16.jpg": "a6b420fe2a2fa84b79156ab5c9e3565f",
"assets/assets/images/carousel/medium17.jpg": "33b4e8dd46d25fd8c71138be45b1e833",
"assets/assets/images/carousel/medium18.jpg": "55cb948a34a37811490168e8f62e9a1b",
"assets/assets/images/carousel/medium19.jpg": "325b10f2cbe0ae0f7f5cfa8ba5b97f6c",
"assets/assets/images/carousel/medium20.jpg": "a4a8871657e0e02fa997c19471a5122e",
"assets/assets/images/carousel/medium21.jpg": "a8e10dc869f5bcb021d43db239cf6f62",
"assets/assets/images/carousel/medium22.jpg": "2d251ade1a0e81ff68a61a364db231ab",
"assets/assets/images/carousel/medium23.jpg": "6d051fd4a65b1c86ac320f85ed12cea4",
"assets/assets/images/carousel/medium24.jpg": "5463c001943d1f50636b7af54485eefc",
"assets/assets/images/carousel/medium25.jpg": "be9cd469ebebc434d7eef9f09bac2c31",
"assets/assets/images/carousel/medium26.jpg": "687c635be51533c7df40aaf0d6c6c50c",
"assets/assets/images/carousel/medium27.jpg": "76411e58b1b56c30e4ac98b0921cc448",
"assets/assets/images/carousel/medium28.jpg": "82f8c5a747ae9285e68a97ba0b256340",
"assets/assets/images/carousel/medium29.jpg": "c44bd46b13e6ab8ccedcd750d4da89ea",
"assets/assets/images/carousel/medium30.jpg": "eda2c01447d2c46f1a7d06fbf1f288e4",
"assets/assets/images/carousel/medium31.jpg": "14ade47c4fff6fda8078a4122b18891e",
"assets/assets/images/carousel/medium32.jpg": "76572cfea467e7bbc20a1f72f0a79e15",
"assets/assets/images/carousel/medium33.jpg": "5761fdf88e2c3792edf6a18707bafe17",
"assets/assets/images/carousel/medium34.jpg": "ef88c9fb47aed7860328ad89b4f2ec2d",
"assets/assets/images/carousel/medium35.jpg": "37781d66e89891a31d4b061a8cfbd6f6",
"assets/assets/images/carousel/medium36.jpg": "8191b96054233d0384401b3a91612040",
"assets/assets/images/carousel/medium37.jpg": "651886e1a8d40241e8b68e59c814a73e",
"assets/assets/images/carousel/medium38.jpg": "a7bec93361c00a4b26075eb19c1ed079",
"assets/assets/images/carousel/medium39.jpg": "036e8cb7214cd3b366d5b26745498006",
"assets/assets/images/carousel/medium40.jpg": "2b007541911be8828e5534f296b5b740",
"assets/assets/images/carousel/medium41.jpg": "2e81e8efaeaf8d358f6741e700569892",
"assets/assets/images/carousel/medium42.jpg": "ff1be846d8e8772c9f1df0dcd9de87af",
"assets/assets/images/carousel/medium43.jpg": "72ad3f71a15d147f12f44d078d4067ca",
"assets/assets/images/carousel/medium44.jpg": "b4bea79e612e555ee81f39a47a7f56d5",
"assets/assets/images/carousel/medium45.jpg": "a1eae1ae04b390453dd59325711c2151",
"assets/assets/images/carousel/medium46.jpg": "07d3a841c9058ec37307f1686a59e9e4",
"assets/assets/images/carousel/medium47.jpg": "c00fe959506b5252b21564a450607a79",
"assets/assets/images/carousel/medium48.jpg": "829ca0bc6ea5e7fcd48e70dfbe2ba327",
"assets/assets/images/carousel/medium49.jpg": "bdbb6681f10c09bfacc87926e1a3919e",
"assets/assets/images/carousel/medium50.jpg": "08e92145844fcc96fdb61c8286006654",
"assets/assets/images/carousel/medium51.jpg": "1df3f66db691f49868559354f57344ea",
"assets/assets/images/carousel/medium52.jpg": "6e28152d7dba3c9977708b1c20959625",
"assets/assets/images/carousel/medium53.jpg": "12c8ac75d698633d757e1b1dab981f87",
"assets/assets/images/carousel/medium54.jpg": "ed19d682969f74a2e489c28c5d66a073",
"assets/assets/images/carousel/medium55.jpg": "5946387719f05fa5d2317b444b36a391",
"assets/assets/images/carousel/medium56.jpg": "5c838840f6edb47586956825f770082f",
"assets/assets/images/carousel/medium57.jpg": "275666ef5d0af4d698a66ca10cfbf37c",
"assets/assets/images/carousel/medium58.jpg": "57ad7496875e10f3dedf695799d87939",
"assets/assets/images/carousel/medium59.jpg": "7fb897bb1115ae6e44f531a93f251ac2",
"assets/assets/images/carousel/medium60.jpg": "e8117735298ec4dc433b4b63ddb1d4bb",
"assets/assets/images/carousel/medium61.jpg": "617a6ca4e5bf16f9443ea2bb66797b3a",
"assets/assets/images/carousel/medium62.jpg": "565ef30e413913cc868f7a6756765410",
"assets/assets/images/cover.jpg": "e1e4b2e46b8d6eabb7330afb0c0d30ff",
"assets/assets/images/disclosure.png": "238a0202fcdbdbd4fff207464bcbe167",
"assets/assets/images/earthNetworked.jpg": "b25ff2ac5eab2cabe18296701eb69ac3",
"assets/assets/images/five_whys.png": "94cf57cbbdc8c07a730ecddd7fa9bef6",
"assets/assets/images/flutteruis/flutter_ui.png": "5c0d0328b234d94ad29e52f7394f0839",
"assets/assets/images/flutteruis/flutter_ui_chrome.png": "87c18c150251758222860015b0c2122e",
"assets/assets/images/flutteruis/flutter_ui_desktop.png": "a21dcc76defe1386b78c29b2c1de4a26",
"assets/assets/images/flutteruis/flutter_ui_examples.png": "fcce5dc917521618c3d528b9dd1cb954",
"assets/assets/images/flutteruis/flutter_ui_install.png": "1888ea979750c298f690d09fe69e3855",
"assets/assets/images/google_logo.png": "b75aecaf9e70a9b1760497e33bcd6db1",
"assets/assets/images/how_projects_work.jpg": "cbac06494f00b2a281f36216f2f271a3",
"assets/assets/images/north_america.jpg": "867d729d34a03bf38136bd45954ec218",
"assets/assets/images/packages/01mvc_pattern.jpg": "99cc7fabc6efa8f1e63f7df4937f256e",
"assets/assets/images/packages/02prefs.jpg": "1e85dede02741358da6404ddfcda8fd6",
"assets/assets/images/packages/03auth.jpg": "b08c120c110180afa51e7cb231c980e1",
"assets/assets/images/packages/04popup.jpg": "25fa504a880ff6dca5d9d72df619a4fd",
"assets/assets/images/packages/05ads.jpg": "f8c27605749eeb59cc84c11a548273a5",
"assets/assets/images/packages/06mvc_application.jpg": "ffdbb84a09e9d47367de6907d776feeb",
"assets/assets/images/packages/07dbutils.jpg": "b30c73898b44099a35d1fad36e1ed5e3",
"assets/assets/images/packages/08stateset.jpg": "a9c4115b05e7e5489322ae7bafe39944",
"assets/assets/images/packages/09translator.jpg": "64e2a99c9e599b903e6750a165af4a8c",
"assets/assets/images/packages/10remote.jpg": "8cafb5aacfa58da35d87c33878c5e439",
"assets/assets/images/phone_hand.jpg": "3dabdc8568b465f34a6e971f565ca550",
"assets/assets/images/phone_mist.jpg": "a21b23d74ecf7290e11b93d7cbf38e79",
"assets/assets/images/phone_mountains.jpg": "b318f6d6faefd8aa86ea93f8a26ede81",
"assets/assets/images/phone_road.jpg": "10273861be4c92643e6153f32d393bb2",
"assets/assets/images/phone_trail.jpg": "ed80186693a180f94183b2d8bb4feafe",
"assets/assets/images/three_trees.jpg": "986c30d96a0b60422a2cffbcff96c890",
"assets/FontManifest.json": "daf1f817658c2d4328a27ae7e3af9150",
"assets/fonts/Electrolize-Regular.ttf": "1be3e0aaeb2bbd1985615a49da7f2eaf",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/fonts/Montserrat-Regular.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/NOTICES": "7a8f7749f4ef8e9f8267a05bd197744f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "19205ec062764b252dd91b10af350b74",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "ab2222ec13ce34baa10eea905ffd7b79",
"/": "ab2222ec13ce34baa10eea905ffd7b79",
"main.dart.js": "893ac9b5296c135b2c433febce60aabd",
"manifest.json": "59323ea3032ab9287a9098a7feef33d4",
"version.json": "4320261ad8d59c532e15261940c392d5"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
