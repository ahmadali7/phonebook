class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]


  def index
    @phone = Phone.new
    @phones = Phone.all
  end

  def new
    @phone = Phone.new
  end

  def show
  end

  def edit
  end

  def create
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @phone.save
      return render partial: "phone", locals: {phone: @phone}
        format.html { redirect_to @phone, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @phone }
        binding.pry
        format.js {return render partial: "phone", locals: {phone: @phone}}
      else
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # binding.pry
    respond_to do |format|
      if @phone.update(update_phone_params)
        return render partial: "phone", locals: {phone: @phone}
        format.html { redirect_to @phone, notice: 'Phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to phones_url, notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  def export
    @phones = Phone.all
    @data =  ""

    @phones.each do |phone|
      outputstring = phone.phone_number + "\t" + phone.name + "\n"
      @data+= outputstring
    end

    send_data @data,:type => 'text',:disposition => "attachment; filename=phone.txt"
  end

  def uploads
    @lines = File.read(params[:file])
    delimiters = ["\t", "\n"]
    result = @lines.split(Regexp.union(delimiters))
    result.each_slice(2) do |phone_number, name|
      @phone = Phone.find_or_create_by(phone_number: phone_number, name: name)
    end
    redirect_to phones_path

  end

  private
    def set_phone
      @phone = Phone.find(params[:id])
    end

    def phone_params
      params.require(:phone).permit(:phone_number, :name)
    end

    def update_phone_params
      params.permit(:phone_number, :name)
    end

end
