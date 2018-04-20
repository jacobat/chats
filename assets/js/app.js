// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

const elmDiv = document.getElementById("elm-main");
import Elm from "./elm"


window.elm_app = Elm.Main.embed(elmDiv);
window.socket = socket;
window.channel = join_channel(socket.channel("room:lobby", {}));
elm_app.ports.check.subscribe(function(number) {
  channel.push("message:add", { message: number})
});
import socket from "./socket"
window.Elm = Elm

function join_channel(channel) {
  console.log("Called join channel");
  channel.join()
    .receive("ok", resp => {
      console.log("Joined successfully!!!", resp);
      channel.push("message:current");
    })
    .receive("error", resp => { console.log("Unable to join", resp) });

  channel.on('room:lobby:new_message', (message) => {
    console.log(channel, message['content']);
    elm_app.ports.updates.send(message['content']);
  })
  return channel;
};
window.join_channel = join_channel;
