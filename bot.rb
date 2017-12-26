require 'net/http'
require 'json'
require 'pry'

uri = URI("http://0.0.0.0/quiz")
p ENV['level']
JSON.parse(File.open("./question_#{ENV['level']}.json") { |f| f.read }).each do |task|
  question = task['question']
  level = task['level']

  parameters = {
    question: question,
    level: level,
    task_id: 1
  }

  Net::HTTP.post_form(uri, parameters)
  sleep 0.5

end
