# encoding: utf-8
namespace :app do
  desc "Encripta todas as senhas não processadas no banco de dados"

  task migrar_senhas: :environment do
    if User.attribute_names.include? "password"
      User.find_each do |user|
        puts "Migrando usuário ##{user.id} #{user.full_name}"
        unencripted_password = user.attributes["password"]

        user.password = unencripted_password
        user.password_confirmation = unencripted_password
        user.save!
      end
    else
      puts "As senhas ja foram migradas, terminando."
    end
  end
end
