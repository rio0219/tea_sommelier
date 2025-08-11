require "openai"

class TeaAI
  def initialize
    @client = OpenAI::Client.new(api_key: ENV["OPENAI_API_KEY"])
  end

  def recommend_tea(situation)
    prompt = "あなたはお茶ソムリエです。次の状況に合うお茶と簡単な説明を提案してください。\n状況: #{situation}"

    completion = @client.completions.create(
      model: "gpt-4o-mini",
      prompt: prompt,
      max_tokens: 150,
      temperature: 0.7
    )

    completion.choices[0].text.strip
  end
end
