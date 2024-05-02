if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('atharva_sw1.js').then((swreg) => {
        console.log("service worker successfully registered ", swreg)
    }).catch((err) => {
        console.error("Service Wroker not registered ", err)
    });
}