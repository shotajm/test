class NotesController < ApplicationController

include ApplicationHelper


  # GET /notes
  # GET /notes.json
  def index
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 3d6c39304d2456958ddf86dc587b95104b9d9f56
=======

>>>>>>> 3a2a46bc5ee5caab923671d91b7927b7439c96db
=======

>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac
    @notes = current_user.notes.all
       @notes = Note.page(params[:page]).per(3).order(:id)
  end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 3d6c39304d2456958ddf86dc587b95104b9d9f56
=======
>>>>>>> 3a2a46bc5ee5caab923671d91b7927b7439c96db
=======
>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac
  # GET /notes/1
  # GET /notes/1.json
def show
    @note = Note.find(params[:id])

end

def search
   @notes = Note.page(params[:page]).per(6).order(:id)
end

  # GET /notes/ne

def new
    @note = Note.new
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3a2a46bc5ee5caab923671d91b7927b7439c96db
=======
>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac
  end


  # GET /notes/1/sedit
  def edit
    @note = Note.find(params[:id])
correct_user
  end



  # POST /notes
  # POST /notes.json
    def create
    @note = Note.new(note_params)

     file=params[:note][:image_1]
    @note.set_image(file)
    @note.user_id = current_user.id
   if @note.save
       redirect_to @note
#redirect_to @note で作成されたものが表示される
      else
         render :new
      end
    end




  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    correct_user
        @note = Note.find(params[:id])
              @note.update_attributes (params[:note])
      if @note.update(note_params)
        redirect_to @note, notice: '編集完了しました'
      else
        render :edit
      end
    end



  # DELETE /notes/1
  # DELETE /notes/1.json


  def destroy
    correct_user
    @note.destroy
<<<<<<< HEAD
<<<<<<< HEAD
     redirect_to notes_url, notice: '掲載削除しました'
=======
>>>>>>> 3d6c39304d2456958ddf86dc587b95104b9d9f56
=======
=======
>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac
    redirect_to root_path
  end

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
        @note = current_user.notes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :user_name, :content, :price, :image_1, :image_2, :image_3, :category, :rule,:user_id)
    end
       def user_params
      params.require(:user, :note).permit(:user_name, :profile_pic, :profile, :area, :email)
    end

   def correct_user
    note = Note.find(params[:id])
    if !current_user?(note.user)
      redirect_to root_path
    end
end
<<<<<<< HEAD
>>>>>>> 3a2a46bc5ee5caab923671d91b7927b7439c96db
=======
>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac
  end


  # GET /notes/1/sedit
  def edit
    @note = Note.find(params[:id])
correct_user
  end




  # POST /notes
  # POST /notes.json
    def create
    @note = Note.new(note_params)

     file=params[:note][:image_1]
    @note.set_image(file)
    @note.user_id = current_user.id
   if @note.save
       redirect_to @note
#redirect_to @note で作成されたものが表示される
      else
         render :new
      end
    end




  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    correct_user
        @note = Note.find(params[:id])
              @note.update_attributes (params[:note])
      if @note.update(note_params)
        redirect_to @note, notice: '編集完了しました'
      else
        render :edit
      end
    end



  # DELETE /notes/1
  # DELETE /notes/1.json


  def destroy
    correct_user
    @note.destroy
    redirect_to root_path
  end

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
        @note = current_user.notes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :user_name, :content, :price, :image_1, :image_2, :image_3, :category, :rule,:user_id)
    end
       def user_params
      params.require(:user, :note).permit(:user_name, :profile_pic, :profile, :area, :email)
    end

   def correct_user
    note = Note.find(params[:id])
    if !current_user?(note.user)
      redirect_to root_path
    end
end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end
=======
>>>>>>> 3a2a46bc5ee5caab923671d91b7927b7439c96db




<<<<<<< HEAD
>>>>>>> 3d6c39304d2456958ddf86dc587b95104b9d9f56
=======
>>>>>>> 3a2a46bc5ee5caab923671d91b7927b7439c96db
=======




>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac





