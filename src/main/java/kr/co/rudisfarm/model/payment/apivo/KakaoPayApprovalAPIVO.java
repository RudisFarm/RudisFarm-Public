package kr.co.rudisfarm.model.payment.apivo;

import java.util.Date;

public class KakaoPayApprovalAPIVO {

	private String aid;
	private String tid;
	private String cid;
	private String sid;
	private String tms_result;
	private AmountAPIVO amount;
	private CardAPIVO card_info;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private String item_name;
	private String item_code;
	private String payload;
	private int quantity;
	private int tax_free_amuont;
	private int vat_amount;
	private Date created_at;
	private Date approved_at;
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getTms_result() {
		return tms_result;
	}
	public void setTms_result(String tms_result) {
		this.tms_result = tms_result;
	}
	public AmountAPIVO getAmount() {
		return amount;
	}
	public void setAmount(AmountAPIVO amount) {
		this.amount = amount;
	}
	public CardAPIVO getCard_info() {
		return card_info;
	}
	public void setCard_info(CardAPIVO card_info) {
		this.card_info = card_info;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getPayment_method_type() {
		return payment_method_type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTax_free_amuont() {
		return tax_free_amuont;
	}
	public void setTax_free_amuont(int tax_free_amuont) {
		this.tax_free_amuont = tax_free_amuont;
	}
	public int getVat_amount() {
		return vat_amount;
	}
	public void setVat_amount(int vat_amount) {
		this.vat_amount = vat_amount;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}
	
	@Override
	public String toString() {
		return "KakaoPayApprovalVO [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", sid=" + sid + ", tms_result="
				+ tms_result + ", amount=" + amount + ", card_info=" + card_info + ", partner_order_id="
				+ partner_order_id + ", partner_user_id=" + partner_user_id + ", payment_method_type="
				+ payment_method_type + ", item_name=" + item_name + ", item_code=" + item_code + ", payload=" + payload
				+ ", quantity=" + quantity + ", tax_free_amuont=" + tax_free_amuont + ", vat_amount=" + vat_amount
				+ ", created_at=" + created_at + ", approved_at=" + approved_at + "]";
	}
}
