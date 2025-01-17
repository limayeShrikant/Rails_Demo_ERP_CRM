class LeadsDatatable < ApplicationDatatable

  private

  def data
    leads.map do |lead|
      [].tap do |column|
        column << lead.first_name
        column << lead.last_name
        column << lead.city
        column << lead.phone

        links = []
        links << link_to('Show', lead, class: "btn btn-success")
        links << link_to('Delete', lead, class: "btn btn-danger", method: :delete, data: { confirm: 'Are you sure, you want to delete this lead?'})
        column << links.join(' ')
      end
    end
  end

  def count
    User.find(@current_user_id).leads.count
  end

  def total_entries
    leads.total_count
  end

  def leads
    @leads ||= fetch_leads
  end

  def fetch_leads
    search_string = []
    search_columns.each do |term|
      search_string << "lower(#{term}) like :search"
    end

    puts "#{@current_user_id} is the ID"

    leads = Lead.where(created_by: @current_user_id).order('first_name ASC')
    leads = leads.page(page).per(per_page)
    leads = leads.order("#{sort_column} #{sort_direction}")
    leads = leads.where(search_string.join(' or '), search: "%#{(params[:search][:value]).downcase}%")
  end

  def columns
    %w(first_name last_name city phone)
  end

  def search_columns
    %w(first_name last_name city phone)
  end
end