class Reply < ActiveRecord::Base
  acts_as_dag_links :node_class_name => 'Post'
end
