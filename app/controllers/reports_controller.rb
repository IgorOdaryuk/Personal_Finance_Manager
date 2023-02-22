class ReportsController < ApplicationController
  before_action :check_signed_in
  before_action :check_category_id_exists, only: %i[report_by_category report_by_dates]
  before_action :check_income, only: %i[report_by_category report_by_dates]

  def index
  end

  def report_by_dates
    render "report_by_dates"
  end

  def report_by_category
    @categories_outlay = {}
    @operations_outlay.all.map { | oper | @categories_outlay[(Category.find(oper.category_id)).name] = 0.0 }
    @operations_outlay.all.map { | oper | @categories_outlay[(Category.find(oper.category_id)).name] += oper.amount.to_f }


    @categories_income = {}
    if @operations_income.length > 0
      @operations_income.all.map { | oper | @categories_income[(Category.find(oper.category_id)).name] = 0.0 }
      @operations_income.all.map { | oper | @categories_income[(Category.find(oper.category_id)).name] += oper.amount.to_f }
    end

    # Just for fun, makes random colors in chart
    @background_colors = []
    (@categories_income.length + @categories_outlay.length).times do
      @background_colors.append("rgb(#{rand 255}, #{rand 255}, #{rand 255})")
    end

    render "report_by_category"
  end

  private
  def check_category_id_exists
    if params[:category_id] == ""
      @operations = Operation.all.where('user_id = ?', current_user.id)
                            .filter_by_start_date(params[:start_date])
                            .filter_by_final_date(params[:final_date]).order(:odate)
    else
      @operations = Operation.all.where('user_id = ?', current_user.id)
                            .filter_by_start_date(params[:start_date])
                            .filter_by_final_date(params[:final_date])
                            .filter_by_category_id(params[:category_id]).order(:odate)
    end
  end

  def check_income
    @operations_outlay = @operations.all.where('income = false')

    @operations_outlay_data  = {}
    @operations_outlay.all.map { | oper | @operations_outlay_data[oper.odate.strftime("%Y-%m-%d")] = 0 }
    @operations_outlay.all.map { | oper | @operations_outlay_data[oper.odate.strftime("%Y-%m-%d")] += oper.amount.to_f.round(2) }

    if params[:income] == 'true'
      @operations_income = @operations.all.where('income = true')
      @operations_income_data  = {}

      @operations_income.all.map { | oper | @operations_income_data[oper.odate.strftime("%Y-%m-%d")] = 0 }
      @operations_income.all.map { | oper | @operations_income_data[oper.odate.strftime("%Y-%m-%d")] += oper.amount.to_f.round(2) }
    else
      @operations_income  = []
      @operations_income_data  = {}
    end

    @operations_outlay_dates = @operations_outlay.all.map { | o | o.odate.strftime("%Y-%m-%d")}.uniq

    if @operations_income_data.length > 0
      @operations_income_dates = @operations_income.all.map { | o | o.odate.strftime("%Y-%m-%d")}.uniq
    end
  end

  def check_signed_in
    redirect_to new_user_session_path unless signed_in?
  end
end
