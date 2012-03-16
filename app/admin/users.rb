# coding:utf-8
ActiveAdmin.register User do
  menu :label => "用户", :priority => 3
  
  filter :name
  filter :email
  filter :created_at
  
  index do
    column :id
    column :name
    column :email
    column :created_at
    column :website
    column :tags
    column "使用的应用数", :using_app_count
    column "添加的应用数", :apps_count
    default_actions
  end
  
  show do |user|
    attributes_table do
      row :id
      row :name
      row :email
      row :created_at
      row :updated_at
      row :website
      row :tags
      row :using_app_count
      row :apps_count
    end
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :website
      f.input :tags
    end
    f.buttons
  end
end
