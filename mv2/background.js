chrome.webRequest.onBeforeSendHeaders.addListener(
    function (details) {
        var {requestHeaders} = details;
        requestHeaders.push(
            {
                name: 'X-Forwarded-For',
                value: '168.95.1.1, 168.95.192.1, 158.205.229.244, 158.205.237.131, 210.139.255.33, 210.139.255.49, 8.8.8.8, 8.8.4.4, 4.2.2.2, 4.2.2.1'
            }
        );
        return {requestHeaders};
    }, {
        urls: [
            '*://*.bing.com/*'
        ],
        types: [
            'main_frame'
        ]
    }, [
        'requestHeaders',
        'blocking'
    ]
);
