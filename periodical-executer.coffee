#   PeriodicalExecuter.coffee
#   (c) 2011 Austin Bales
#   PeriodicalExecuter is freely distributable under the MIT license.
#   
#   This class is a port of the PeriodicalExecuter class 
#   found in Sam Stephenson's Prototype.js

class PeriodicalExecuter
  constructor: (@callback, @frequency) ->
    @currentlyExecuting = no
    @registerCallback()

  registerCallback: ->
    @timer = setInterval @onTimerEvent, @frequency * 1000
  
  execute: ->
    @callback(@)
  
  stop: ->
    unless @timer then return false
    clearInterval @timer
    @timer = null
  
  onTimerEvent: =>
    if not @currentlyExecuting
      try
        @currentlyExecuting = yes
        @execute()
      finally
        @currentlyExecuting = no