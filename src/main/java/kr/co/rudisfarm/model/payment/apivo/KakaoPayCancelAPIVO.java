package kr.co.rudisfarm.model.payment.apivo;

import java.util.Date;

public class KakaoPayCancelAPIVO {
	private String aid;
	private String tid;
	private String cid;
	private String status;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private AmountAPIVO amount;
	private ApprovedCancelAmountAPIVO approved_cancel_amount;
	private CanceledAmountAPIVO canceled_amount;
	private CanceledAvailableAmountAPIVO cancel_available_amount;
	private String item_name;
	private String item_code;
	private int quantity;
	private Date created_at;
	private Date approved_at;
	private Date canceled_at;
	private String payload;
	
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public AmountAPIVO getAmount() {
		return amount;
	}
	public void setAmount(AmountAPIVO amount) {
		this.amount = amount;
	}
	public ApprovedCancelAmountAPIVO getApproved_cancel_amount() {
		return approved_cancel_amount;
	}
	public void setApproved_cancel_amount(ApprovedCancelAmountAPIVO approved_cancel_amount) {
		this.approved_cancel_amount = approved_cancel_amount;
	}
	public CanceledAmountAPIVO getCanceled_amount() {
		return canceled_amount;
	}
	public void setCanceled_amount(CanceledAmountAPIVO canceled_amount) {
		this.canceled_amount = canceled_amount;
	}
	public CanceledAvailableAmountAPIVO getCancel_available_amount() {
		return cancel_available_amount;
	}
	public void setCancel_available_amount(CanceledAvailableAmountAPIVO cancel_available_amount) {
		this.cancel_available_amount = cancel_available_amount;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	public Date getCanceled_at() {
		return canceled_at;
	}
	public void setCanceled_at(Date canceled_at) {
		this.canceled_at = canceled_at;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}
	
	@Override
	public String toString() {
		return "KakaoPayCancelVO [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", status=" + status
				+ ", partner_order_id=" + partner_order_id + ", partner_user_id=" + partner_user_id
				+ ", payment_method_type=" + payment_method_type + ", amount=" + amount + ", approved_cancel_amount="
				+ approved_cancel_amount + ", canceled_amount=" + canceled_amount + ", cancel_available_amount="
				+ cancel_available_amount + ", item_name=" + item_name + ", item_code=" + item_code + ", quantity="
				+ quantity + ", created_at=" + created_at + ", approved_at=" + approved_at + ", canceled_at="
				+ canceled_at + ", payload=" + payload + "]";
	}
}
