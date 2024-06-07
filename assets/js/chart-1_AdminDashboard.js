"use strict";
!function () {
    let e, r, a;
    a = (isDarkStyle ? (e = config.colors_dark.textMuted, r = config.colors_dark.headingColor, config.colors_dark) : (e = config.colors.textMuted, r = config.colors.headingColor, config.colors)).borderColor;
    var s = {
        donut: {
            series1: "#71dd37e8",
            series2: "#71dd37bf",
            series3: config.colors.success,
            series4: "#71dd3799",
            series5: "#71dd3766",
            series6: "#71dd3733"
        }
    }, t = document.querySelector("#leadsReportChart"), s = {
        chart: {height: 157, width: 130, parentHeightOffset: 0, type: "donut"},
        labels: ["Asalto", "Disturbio", "Agresión física", "Agresión verbal", "Incendio", "Acoso"],
        series: [15, 30, 10, 20, 30, 15],
        colors: [s.donut.series1, s.donut.series2, s.donut.series3, s.donut.series4, s.donut.series5, s.donut.series6],
        stroke: {width: 0},
        dataLabels: {
            enabled: !1, formatter: function (e, a) {
                return parseInt(e) + "%"
            }
        },
        legend: {show: !1},
        tooltip: {theme: !1},
        grid: {padding: {top: 0}},
        plotOptions: {
            pie: {
                donut: {
                    size: "75%",
                    labels: {
                        show: !0,
                        value: {
                            fontSize: "1.5rem",
                            fontFamily: "Public Sans",
                            color: r,
                            fontWeight: 500,
                            offsetY: -15,
                            formatter: function (e) {
                                return parseInt(e) + "%"
                            }
                        },
                        name: {offsetY: 20, fontFamily: "Public Sans"},
                        total: {
                            show: !0, fontSize: ".7rem", label: "Total", color: e, formatter: function (e) {
                                return "120"
                            }
                        }
                    }
                }
            }
        }
    };
    null !== t && new ApexCharts(t, s).render();
}();