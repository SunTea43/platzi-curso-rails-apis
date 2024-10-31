# frozen_string_literal: true

PostReport = Struct.new(:word_count, :word_histogram) do
  def self.generate(post)
    PostReport.new(
      # word_count
      post.content.split.map { |word| word.gsub(/\W/, '') }.count,
      # word_histogram
      calc_histogram(post)
    )
  end

  def self.calc_histogram(post)
    post
      .content
      .split
      .map { |word| word.gsub(/\W/, '') }
      .map(&:downcase)
      .group_by { |word| word }
      .transform_values(&:size)
  end
end
