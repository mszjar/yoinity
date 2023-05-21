class PollyClient
  require 'aws-sdk-polly'

  def initialize
    @client = Aws::Polly::Client.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    )
  end

  def synthesize_speech(text)
    response = @client.synthesize_speech({
      output_format: "mp3",
      text: text,
      voice_id: "Joanna", # Feel free to change this to another voice
    })

    handle_response(response)
  end

  private

  def handle_response(response)
    # Here we'll create an mp3 file with the audio stream from the response
    file_path = Rails.root.join('tmp', 'speech.mp3')
    File.open(file_path, 'wb') do |file|
      file.write(response.audio_stream.read)
    end
    file_path
  end
end
