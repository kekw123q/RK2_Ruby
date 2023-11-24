# frozen_string_literal: trued
class CalculationsController < ApplicationController
  before_action :assertion, only: [:result]
  def input
    # Здесь может быть код для обработки ввода данных
  end

  def assertion
    arr_ass = params[:v1].split(',').map(&:to_i)
    arr_ass.each do |elem|
      if elem.to_i.zero?
        flash[:alert] = 'необходимо вводить только числа разделенные запятыми и длинна массива должна быть больше 1'
        redirect_to action: :input and break
      end
    end
  end

  def result
    if params[:v1].split(',').length <= 1
      @result = 'ошибка введите массив длинной больше 1, элементы которого разделены запятой'
      @result2 = 'ошибка введите массив длинной больше 1, элементы которого разделены запятой'
    end
    arr_d = params[:v1].split(',').map(&:to_i)
    max_diff = 0
    max_indices = []
    (0...arr_d.length / 2).each do |i|
      diff = (arr_d[i] - arr_d[arr_d.length - 1 - i]).abs
      if diff > max_diff
        max_diff = diff
        max_indices = [i, arr_d.length - 1 - i]
      end
      @result = max_indices
      @result2 = max_diff
    end
  end
end
