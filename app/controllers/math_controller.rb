class MathController < ApplicationController
  def home
    render(template: "/math_templates/home")
  end

  def square_new
    render(template: "/math_templates/square_new")
  end

  def square_results
    @input_num = params.fetch("users_number")
    @result_num = params.fetch("users_number").to_f ** 2

    render(template: "/math_templates/square_results")
  end

  def square_root_new
    render(template: "/math_templates/square_root_new")
  end

  def square_root_results
    @input_num = params.fetch("users_number")
    @result_num = Math.sqrt(params.fetch("users_number").to_f)  

    render(template: "/math_templates/square_root_results")
  end

  def payment_new
    render(template: "/math_templates/payment_new")
  end

  def payment_results
    @apr = params.fetch("apr").to_f
    @years = params.fetch("years").to_i
    @principal = params.fetch("principal").to_f
    @apr_monthly = @apr/12/100
    @years_monthly = @years * -12
    @numerator = @principal * @apr_monthly
    @denominator = 1 - ((1 + @apr_monthly) ** @years_monthly)
    @payment = (@numerator/@denominator).to_fs(:currency)

    render(template: "/math_templates/payment_results")
  end

  def random_new
    render(template: "/math_templates/random_new")
  end

  def random_results
    @users_min = params.fetch("users_min").to_f
    @users_max = params.fetch("users_max").to_f
    @rand_num = rand(@users_min..@users_max)

    render(template: "/math_templates/random_results")
  end
end
