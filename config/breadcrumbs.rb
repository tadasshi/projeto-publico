crumb :root do
  link 'Home', root_path
end

crumb :sobre_nos do
  link 'Sobre nós', sobre_nos_path
end

crumb :contato do
  link 'Contato', contato_path
end

crumb :bibliographies do
  link 'Bibliografias', bibliographies_path
end

crumb :bibliography do |bibliography|
  link bibliography.title, bibliography
  parent :bibliographies
end

crumb :ebooks do
  link 'Ebooks', ebooks_path
end

crumb :ebook do |ebook|
  link ebook.title, ebook
  parent :ebooks
end

crumb :metaphors do
  link 'Metáforas', metaphors_path
end

crumb :metaphor do |metaphor|
  link metaphor.title, metaphor
  parent :metaphors
end

crumb :posts do
  link 'Blog/Posts', posts_path
end

crumb :post do |post|
  link post.title, post
  parent :posts
end

crumb :biographies do
  link 'Biografias', biographies_path
end

crumb :biography do |biography|
  link biography.title, biography
  parent :biographies
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).