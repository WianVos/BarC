var stats = {
    type: "GROUP",
name: "Global Information",
path: "",
pathFormatted: "missing-name-b06d1",
stats: {
    "name": "Global Information",
    "numberOfRequests": {
        "total": "2",
        "ok": "0",
        "ko": "2"
    },
    "minResponseTime": {
        "total": "60007",
        "ok": "-",
        "ko": "60007"
    },
    "maxResponseTime": {
        "total": "60028",
        "ok": "-",
        "ko": "60028"
    },
    "meanResponseTime": {
        "total": "60017",
        "ok": "-",
        "ko": "60017"
    },
    "standardDeviation": {
        "total": "10",
        "ok": "-",
        "ko": "10"
    },
    "percentiles1": {
        "total": "60017",
        "ok": "-",
        "ko": "60017"
    },
    "percentiles2": {
        "total": "60022",
        "ok": "-",
        "ko": "60022"
    },
    "percentiles3": {
        "total": "60026",
        "ok": "-",
        "ko": "60026"
    },
    "percentiles4": {
        "total": "60027",
        "ok": "-",
        "ko": "60027"
    },
    "group1": {
        "name": "t < 800 ms",
        "count": 0,
        "percentage": 0
    },
    "group2": {
        "name": "800 ms < t < 1200 ms",
        "count": 0,
        "percentage": 0
    },
    "group3": {
        "name": "t > 1200 ms",
        "count": 0,
        "percentage": 0
    },
    "group4": {
        "name": "failed",
        "count": 2,
        "percentage": 100
    },
    "meanNumberOfRequestsPerSecond": {
        "total": "0.014",
        "ok": "-",
        "ko": "0.014"
    }
},
contents: {
"request-0-684d2": {
        type: "REQUEST",
        name: "request_0",
path: "request_0",
pathFormatted: "request-0-684d2",
stats: {
    "name": "request_0",
    "numberOfRequests": {
        "total": "1",
        "ok": "0",
        "ko": "1"
    },
    "minResponseTime": {
        "total": "60028",
        "ok": "-",
        "ko": "60028"
    },
    "maxResponseTime": {
        "total": "60028",
        "ok": "-",
        "ko": "60028"
    },
    "meanResponseTime": {
        "total": "60028",
        "ok": "-",
        "ko": "60028"
    },
    "standardDeviation": {
        "total": "0",
        "ok": "-",
        "ko": "0"
    },
    "percentiles1": {
        "total": "60028",
        "ok": "-",
        "ko": "60028"
    },
    "percentiles2": {
        "total": "60028",
        "ok": "-",
        "ko": "60028"
    },
    "percentiles3": {
        "total": "60028",
        "ok": "-",
        "ko": "60028"
    },
    "percentiles4": {
        "total": "60028",
        "ok": "-",
        "ko": "60028"
    },
    "group1": {
        "name": "t < 800 ms",
        "count": 0,
        "percentage": 0
    },
    "group2": {
        "name": "800 ms < t < 1200 ms",
        "count": 0,
        "percentage": 0
    },
    "group3": {
        "name": "t > 1200 ms",
        "count": 0,
        "percentage": 0
    },
    "group4": {
        "name": "failed",
        "count": 1,
        "percentage": 100
    },
    "meanNumberOfRequestsPerSecond": {
        "total": "0.007",
        "ok": "-",
        "ko": "0.007"
    }
}
    },"request-2-93baf": {
        type: "REQUEST",
        name: "request_2",
path: "request_2",
pathFormatted: "request-2-93baf",
stats: {
    "name": "request_2",
    "numberOfRequests": {
        "total": "1",
        "ok": "0",
        "ko": "1"
    },
    "minResponseTime": {
        "total": "60007",
        "ok": "-",
        "ko": "60007"
    },
    "maxResponseTime": {
        "total": "60007",
        "ok": "-",
        "ko": "60007"
    },
    "meanResponseTime": {
        "total": "60007",
        "ok": "-",
        "ko": "60007"
    },
    "standardDeviation": {
        "total": "0",
        "ok": "-",
        "ko": "0"
    },
    "percentiles1": {
        "total": "60007",
        "ok": "-",
        "ko": "60007"
    },
    "percentiles2": {
        "total": "60007",
        "ok": "-",
        "ko": "60007"
    },
    "percentiles3": {
        "total": "60007",
        "ok": "-",
        "ko": "60007"
    },
    "percentiles4": {
        "total": "60007",
        "ok": "-",
        "ko": "60007"
    },
    "group1": {
        "name": "t < 800 ms",
        "count": 0,
        "percentage": 0
    },
    "group2": {
        "name": "800 ms < t < 1200 ms",
        "count": 0,
        "percentage": 0
    },
    "group3": {
        "name": "t > 1200 ms",
        "count": 0,
        "percentage": 0
    },
    "group4": {
        "name": "failed",
        "count": 1,
        "percentage": 100
    },
    "meanNumberOfRequestsPerSecond": {
        "total": "0.007",
        "ok": "-",
        "ko": "0.007"
    }
}
    }
}

}

function fillStats(stat){
    $("#numberOfRequests").append(stat.numberOfRequests.total);
    $("#numberOfRequestsOK").append(stat.numberOfRequests.ok);
    $("#numberOfRequestsKO").append(stat.numberOfRequests.ko);

    $("#minResponseTime").append(stat.minResponseTime.total);
    $("#minResponseTimeOK").append(stat.minResponseTime.ok);
    $("#minResponseTimeKO").append(stat.minResponseTime.ko);

    $("#maxResponseTime").append(stat.maxResponseTime.total);
    $("#maxResponseTimeOK").append(stat.maxResponseTime.ok);
    $("#maxResponseTimeKO").append(stat.maxResponseTime.ko);

    $("#meanResponseTime").append(stat.meanResponseTime.total);
    $("#meanResponseTimeOK").append(stat.meanResponseTime.ok);
    $("#meanResponseTimeKO").append(stat.meanResponseTime.ko);

    $("#standardDeviation").append(stat.standardDeviation.total);
    $("#standardDeviationOK").append(stat.standardDeviation.ok);
    $("#standardDeviationKO").append(stat.standardDeviation.ko);

    $("#percentiles1").append(stat.percentiles1.total);
    $("#percentiles1OK").append(stat.percentiles1.ok);
    $("#percentiles1KO").append(stat.percentiles1.ko);

    $("#percentiles2").append(stat.percentiles2.total);
    $("#percentiles2OK").append(stat.percentiles2.ok);
    $("#percentiles2KO").append(stat.percentiles2.ko);

    $("#percentiles3").append(stat.percentiles3.total);
    $("#percentiles3OK").append(stat.percentiles3.ok);
    $("#percentiles3KO").append(stat.percentiles3.ko);

    $("#percentiles4").append(stat.percentiles4.total);
    $("#percentiles4OK").append(stat.percentiles4.ok);
    $("#percentiles4KO").append(stat.percentiles4.ko);

    $("#meanNumberOfRequestsPerSecond").append(stat.meanNumberOfRequestsPerSecond.total);
    $("#meanNumberOfRequestsPerSecondOK").append(stat.meanNumberOfRequestsPerSecond.ok);
    $("#meanNumberOfRequestsPerSecondKO").append(stat.meanNumberOfRequestsPerSecond.ko);
}
