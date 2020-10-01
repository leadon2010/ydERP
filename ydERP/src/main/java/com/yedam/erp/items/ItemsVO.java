package com.yedam.erp.items;

import java.util.Date;

public class ItemsVO {
   private String itemCode;
   private String itemName;
   private String uom;
   private Integer inQty;
   private Integer supplyPrice;
   private Integer sellingPrice;
   private Double itemTax;
   private Integer expireDate;
   private String vendorCode;
   private String vendorName;
   private Date addDate;
   private int first;
   private int last;
   private String searchCondition;
   private String searchKeyword;
   private String pGroup1;
   private String pGroup2;
   private String pGroup2Name;
   private String pGroup3;
   private String pGroup3Name;
   private Integer minQty;
   private String msg;
   private String lookupCode;
   private String lookupValues;

   public String getLookupCode() {
      return lookupCode;
   }

   public void setLookupCode(String lookupCode) {
      this.lookupCode = lookupCode;
   }

   public String getLookupValues() {
      return lookupValues;
   }

   public void setLookupValues(String lookupValues) {
      this.lookupValues = lookupValues;
   }

   public String getItemCode() {
      return itemCode;
   }

   public void setItemCode(String itemCode) {
      this.itemCode = itemCode;
   }

   public String getItemName() {
      return itemName;
   }

   public void setItemName(String itemName) {
      this.itemName = itemName;
   }

   public String getUom() {
      return uom;
   }

   public void setUom(String uom) {
      this.uom = uom;
   }

   public Integer getInQty() {
      return inQty;
   }

   public void setInQty(Integer inQty) {
      this.inQty = inQty;
   }

   public Integer getSupplyPrice() {
      return supplyPrice;
   }

   public void setSupplyPrice(Integer supplyPrice) {
      this.supplyPrice = supplyPrice;
   }

   public Integer getSellingPrice() {
      return sellingPrice;
   }

   public void setSellingPrice(Integer sellingPrice) {
      this.sellingPrice = sellingPrice;
   }

   public Double getItemTax() {
      return itemTax;
   }

   public void setItemTax(Double itemTax) {
      this.itemTax = itemTax;
   }

   public Integer getExpireDate() {
      return expireDate;
   }

   public void setExpireDate(Integer expireDate) {
      this.expireDate = expireDate;
   }

   public String getVendorCode() {
      return vendorCode;
   }

   public void setVendorCode(String vendorCode) {
      this.vendorCode = vendorCode;
   }

   public String getVendorName() {
      return vendorName;
   }

   public void setVendorName(String vendorName) {
      this.vendorName = vendorName;
   }

   public Date getAddDate() {
      return addDate;
   }

   public void setAddDate(Date addDate) {
      this.addDate = addDate;
   }

   public int getFirst() {
      return first;
   }

   public void setFirst(int first) {
      this.first = first;
   }

   public int getLast() {
      return last;
   }

   public void setLast(int last) {
      this.last = last;
   }

   public String getSearchCondition() {
      return searchCondition;
   }

   public void setSearchCondition(String searchCondition) {
      this.searchCondition = searchCondition;
   }

   public String getSearchKeyword() {
      return searchKeyword;
   }

   public void setSearchKeyword(String searchKeyword) {
      this.searchKeyword = searchKeyword;
   }

   public String getpGroup1() {
      return pGroup1;
   }

   public void setpGroup1(String pGroup1) {
      this.pGroup1 = pGroup1;
   }

   public String getpGroup2() {
      return pGroup2;
   }

   public void setpGroup2(String pGroup2) {
      this.pGroup2 = pGroup2;
   }

   public String getpGroup2Name() {
      return pGroup2Name;
   }

   public void setpGroup2Name(String pGroup2Name) {
      this.pGroup2Name = pGroup2Name;
   }

   public String getpGroup3() {
      return pGroup3;
   }

   public void setpGroup3(String pGroup3) {
      this.pGroup3 = pGroup3;
   }

   public String getpGroup3Name() {
      return pGroup3Name;
   }

   public void setpGroup3Name(String pGroup3Name) {
      this.pGroup3Name = pGroup3Name;
   }

   public Integer getMinQty() {
      return minQty;
   }

   public void setMinQty(Integer minQty) {
      this.minQty = minQty;
   }

   public String getMsg() {
      return msg;
   }

   public void setMsg(String msg) {
      this.msg = msg;
   }

   @Override
   public String toString() {
      return "ItemsVO [itemCode=" + itemCode + ", itemName=" + itemName + ", uom=" + uom + ", inQty=" + inQty + ", supplyPrice=" + supplyPrice + ", sellingPrice=" + sellingPrice + ", itemTax="
            + itemTax + ", expireDate=" + expireDate + ", vendorCode=" + vendorCode + ", vendorName=" + vendorName + ", addDate=" + addDate + ", first=" + first + ", last=" + last
            + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", pGroup1=" + pGroup1 + ", pGroup2=" + pGroup2 + ", pGroup2Name=" + pGroup2Name + ", pGroup3="
            + pGroup3 + ", pGroup3Name=" + pGroup3Name + ", minQty=" + minQty + ", msg=" + msg + "]";
   }

}