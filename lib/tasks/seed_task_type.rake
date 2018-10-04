namespace :task_type do
  desc "Create new work types for applicaiton startup"
  task create: :environment do
    ['Work', 'Family', 'Personal', 'Hobby'].each do |task_type|
      TaskType.find_or_create_by(name: task_type)
    end
  end
end
