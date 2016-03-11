$(function () {
    $.get('data/chart-2-percentage.csv', function(csv) {
        $('#chart-2-percentage').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Requerimentos por tipo (2015)'
            },
            tooltip: {
                pointFormat: 'Quantidade: <b>{point.y}</b> <br/>{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            data: {
                csv: csv
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                    }
                }
            }
        });
    });
});