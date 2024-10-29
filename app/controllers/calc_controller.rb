class CalcController < ApplicationController
  def square_new
    render({ :template => "square_new" })
  end

  def square_results
    @sq_number = params.fetch("number").to_f
    @sq_result = @sq_number ** 2
    render({ :template => "square_results" })
  end

  def square_root_new
    render({ :template => "square_root_new" })
  end

  def square_root_results
    @sqr_number = params.fetch("user_number").to_f
    @sqr_result = Math.sqrt(@sqr_number)
    render({ :template => "square_root_results" })
  end

  def payment_new
    render({ :template => "payment_new" })
  end

  def payment_results
    r = params.fetch("user_apr").to_f / 100 / 12
    @p_apr = params.fetch("user_apr").to_f.to_fs(:percentage, { :precision => 4 })
    @p_years = params.fetch("user_years").to_i
    n = @p_years * 12
    pv = params.fetch("user_pv").to_f
    @p_principal = pv.to_fs(:currency)
    p = (r * pv) / (1 - ((1 + r) ** (-n)))
    @p_result = p.to_fs(:currency)
    render({ :template => "payment_results" })
  end

  def random_new
    render({ :template => "random_new" })
  end

  def random_results
    @r_min = params.fetch("user_min").to_f
    @r_max = params.fetch("user_max").to_f
    @r_result = rand(@r_min..@r_max)
    render({ :template => "random_results" })
  end
end
