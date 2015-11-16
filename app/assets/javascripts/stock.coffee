# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  if $('#chart_container').length
    $('#chart_container').highcharts
      chart: type: 'area'
      title: text: 'Stock Growth'
      credits: false
      xAxis:
        allowDecimals: false
        labels: formatter: ->
          @value + new Date().getFullYear()
      yAxis:
        title: text: 'Stock Value'
        labels: formatter: ->
          @value + '$'
      tooltip:
        pointFormat: '<b>{series.name}</b> stock value in {point.x} years - {point.y}$',
        headerFormat: ''
      series: [
        {
          name: $('#chart_container').data('name')
          data: $('#chart_container').data('shares')
        }

      ]


$ ->
  ready

$(document).on('page:load', ready)

