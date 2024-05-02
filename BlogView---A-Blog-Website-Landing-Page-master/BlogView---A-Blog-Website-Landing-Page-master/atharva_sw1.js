var myFirstCacheUrl = [
    "/index.html",
    "/styles.css"
]

self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open('atharvaCacheUrl')
            .then(
                (cache) => {
                    cache.addAll(myFirstCacheUrl)
                }
            )
    )
})

self.addEventListener('fetch',
    (event) => {
        (req) => {
            if (caches.match(req)) {
                return caches.match(req)
            }
            return fetch(req)
        }
    }
)