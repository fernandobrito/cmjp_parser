// Type = normal | percent
var stacked_relative = function(id, type) {
    $(id).highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Stacked column chart'
        },
        xAxis: {
            categories: ['Vereador A', 'Vereador B', 'Vereador C', 'Vereador D', 'Vereador E']
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Total fruit consumption'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                }
            }
        },
        legend: {
            align: 'center',
            verticalAlign: 'bottom',
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            headerFormat: '<b>{point.x}</b><br/>',
            pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
        },
        plotOptions: {
            column: {
                stacking: type,
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black'
                    }
                }
            }
        },
        series: [{
            name: 'Mudança de nome de rua',
            data: [5, 3, 4, 7, 2]
        }, {
            name: 'Aplausos',
            data: [2, 2, 3, 2, 1]
        }, {
            name: 'Repúdio',
            data: [3, 4, 4, 2, 5]
        }, {
            name: 'Cidadão pessoense',
            data: [3, 5, 2, 2, 1]
        }]
    });
}