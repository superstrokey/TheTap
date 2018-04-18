require! {
    './engine': Engine
    './log'
    './settings'
}

document.body.innerHTML = '<div class="msg-loading">Loading...</div>';
log.main "Starting \"The Tap\" (version: #{settings.version})"
new Engine!.run!
