ActiveAdmin.register User do

  index do
    column :name
    column :email
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :name
      f.input :password
    end
    f.buttons
  end

end
