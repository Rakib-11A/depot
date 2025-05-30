require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(
      title: "Space Suit",
      description: "More than 50 years of NASA expertise is going into the design of modern spacesuits that will protect and support astronauts as they reach iconic heights during forays in low-Earth orbit, the Moon, and worlds beyond. The agency is partnering with commercial provider Axiom Space to provide next-generation spacesuits perfectly suited to NASA’s expanded mission portfolio.",
      image_url: "space_suit.jpg"
    )

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    product = Product.new(
      title: "Black Hole",
      description: %{
        Black holes are among the most mysterious cosmic objects, much studied but not fully understood. These objects aren’t really holes. They’re huge concentrations of matter packed into very tiny spaces. A black hole is so dense that gravity just beneath its surface, the event horizon, is strong enough that nothing – not even light – can escape. The event horizon isn’t a surface like Earth’s or even the Sun’s. It’s a boundary that contains all the matter that makes up the black hole.
      },
      price: 1,
      image_url: "blackhole.jpg"
    )
  end

  test "image_url must be valid url" do
    ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.jpg http: //a.b.c/x/y/z/fred.gif}
    bad = %w{fred.doc fred.gif/more fred.gif.more}

    ok.each do |image_url|
      assert new_product(image_url).valid?
      "#{image_url} must be valid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?
      "#{image_url} must be invalid"
    end
  end
end
