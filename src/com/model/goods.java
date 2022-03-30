package com.model;

public class goods {
	private String typeID = "";//商品类型ID
	private String goodsName = "";//商品名
	private String introduce = "";//商品介绍
	private String price = "";//商品原价
	private String nowPrice = "";//商品现价
	private String picture = "";//商品图片
	private String newGoods = "";//是否为新商品
	private String sale = "";//是否在售
	private String hit = "";//热度值
	
	public goods() {}
	
	public String getTypeID() {
		return typeID;
	}

	public void setTypeID(String typeID) {
		this.typeID = typeID;
	}
	
	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getNowPrice() {
		return nowPrice;
	}

	public void setNowPrice(String nowPrice) {
		this.nowPrice = nowPrice;
	}
	
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public String getNewGoods() {
		return newGoods;
	}

	public void setNewGoods(String newGoods) {
		this.newGoods = newGoods;
	}
	
	public String getSale() {
		return sale;
	}

	public void setSale(String sale) {
		this.sale = sale;
	}
	
	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}
}
