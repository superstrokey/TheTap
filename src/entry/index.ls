require! {
    '../core/engine': Engine
    '../core/log'
    '../settings'
}

import './style.css'

log.main "Starting \"The Tap\" (version: #{settings.version})"
engine = new Engine!
engine.init \test
