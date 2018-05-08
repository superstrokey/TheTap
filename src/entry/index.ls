require! {
    '../core/engine': Engine
    '../core/log'
    '../settings'
}

log.main "Starting \"The Tap\" (version: #{settings.version})"
the-tap = new Engine!
the-tap.init \test
