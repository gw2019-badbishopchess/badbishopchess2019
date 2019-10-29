#  $(document).ready =>
#       username = ''

#       updateChat = (data) ->
#         $('.message-chatroom').append """
#           <div class="col-12">
#             <small class="chat-message username">#{data.username}</small>
#             <p class="chat-message">#{data.message}</p>
#             <hr />
#           </div>
#         """
#         return

#       $('#chat-input').keyup (event) ->
#         if event.keyCode == 13 and !event.shiftKey
#           username = event.target.value
#           console.log event
#           # message =
#           # game_id = 
#           # user_id = 
#         return

#       # $('#chat-input').on 'ajax:success', (data) ->
#       #   $('#chat-input')[0].reset()
#       #   return

#       # pusher = new Pusher('<%= ENV["PUSHER_KEY"] %>',
#       #   cluster: '<%= ENV["PUSHER_CLUSTER"] %>'
#       #   encrypted: true)
#       # channel = pusher.subscribe('chat')
#       # channel.bind 'new', (data) ->
#       #   updateChat data
#       #   return
#       # return