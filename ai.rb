require "openai"

class TeaAI
  def initialize
    @client = OpenAI::Client.new(api_key: ENV["OPENAI_API_KEY"])
  end

  def recommend_tea(situation)
    prompt = "あなたはお茶ソムリエです。次の状況に合うお茶と簡単な説明を提案してください。\n状況: #{situation}"

    response = @client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [
          { role: "system", content: "あなたはお茶の専門家です。" },
          { role: "user", content: prompt }
        ],
        temperature: 0.7
      }
    )

    response.dig("choices", 0, "message", "content")
  end
end
