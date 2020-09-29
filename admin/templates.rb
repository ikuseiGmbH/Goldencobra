ActiveAdmin.register Goldencobra::Template, as: "Template" do
  menu parent: I18n.t("settings", scope: ["active_admin","menue"]),
       label: I18n.t("active_admin.template.as"), if: proc{can?(:update, Goldencobra::Article)}

  index do
    selectable_column
    column :id
    column :title
    column :layout_file_name
    column :articletypes do |t|
      link_to(t.articletypes.count, "/admin/articletypes?q%5Barticletype_templates_template_id_eq%5D=#{t.id}")
    end
    column :articles do |t|
      Goldencobra::Article.where(template_file: t.layout_file_name).count
    end
    actions
  end
end

