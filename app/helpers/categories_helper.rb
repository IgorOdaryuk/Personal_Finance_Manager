module CategoriesHelper
  def submit_category_type
    if current_page?(new_category_path)
      t('categories.form.create')
    else
      t('categories.form.update')
    end
  end
end
