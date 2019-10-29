$(document).ready =>
      $('#chat-form').on 'ajax:success', (data) ->
        $('#chat-form')[0].reset()
        updateChat data.detail[0]
        return

      updateChat = (data) ->
        $('.chat-box').append """
          <div class="col-12">
            <div class="chat bg-secondary d-inline-block text-left text-white mb-2">
              <div class="chat-bubble">
                <small class="chat-username">#{data.username}</small>
                <p class="m-0 mt-2 chat-message">#{data.message}</p>
              </div>
            </div>
          </div>
        """
        return