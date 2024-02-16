class BooksController < ApplicationController

    # GET /books
    # This action will show all books in your collection
    def index
      @books = Book.all
    end
  
    # GET /books/new
    # This action will show a form to add a new book
    def new
      @book = Book.new
    end
  
    # POST /books
    # This action will handle the form submission from the 'new' action
    # and will create a new book in the database
    def create
      @book = Book.new(book_params)
      if @book.save
        flash[:success] = "Book was successfully created."
        redirect_to @book
      else
        render :new
      end
    end
  
    # GET /books/:id/edit
    # This action will show a form to edit an existing book
    def edit
      @book = Book.find(params[:id])
    end
  
    # PATCH/PUT /books/:id
    # This action will handle the form submission from the 'edit' action
    # and will update the book in the database
    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:success] = "Book was successfully updated."
        redirect_to @book
      else
        render :edit
      end
    end
  
    # GET /books/:id
    # This action will show the details of a single book
    def show
      @book = Book.find(params[:id])
    end
  
    def delete
        @book = Book.find(params[:id])
    end

    # DELETE /books/:id
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:success] = "Book was successfully deleted."
        redirect_to books_url
    end
  
    private
      # Use callbacks to share common setup or constraints between actions
      def set_book
        @book = Book.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through
      def book_params
        params.require(:book).permit(:title, :author, :price, :published_date)
      end
  end
  
