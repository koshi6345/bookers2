class BookCommentsController < ApplicationController

  def create
    @book_comment = BookComment.new
    @book = Book.find(params[:book_id])
    @user = @book.user
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
  end

  def destroy
    @book_comment = BookComment.new
    @book = Book.find(params[:book_id])
    @user = @book.user
    #@comment = BookComment.find(params[:id])
    #@comment.destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    #@comment = current_user.book_comments.find(params[:id])
    #@comment.destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
