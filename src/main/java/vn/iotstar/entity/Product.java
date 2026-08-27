package vn.iotstar.entity;

import java.io.Serializable;
import jakarta.persistence.*;

@Entity
@Table(name="products")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="productId")
    private int productId;

    @Column(name="productName", columnDefinition ="NVARCHAR(255) NULL")
    private String productName;

    @Column(name="description", columnDefinition ="TEXT NULL")
    private String description;

    @Column(name="price")
    private double price;

    @Column(name="unit", columnDefinition ="NVARCHAR(50) NULL")
    private String unit;

    @Column(name="images", columnDefinition ="NVARCHAR(255) NULL")
    private String images;

    @Column(name="status")
    private int status;

    // bi-directional many-to-one association to Category
    @ManyToOne
    @JoinColumn(name="categoryId")
    private Category category;

    public Product() {
    }

    public int getProductId() {
        return this.productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
