variable "v_appId" {
    type = string
}
variable "v_password" {
    type = string
}
variable "v_subscription_id" {
    type = string
}
variable "v_tenant_id" {
    type = string
}
variable "v_vm_name" {
    type = string
}
variable "v_rg" {
    type = string
}
variable "v_prefix" {
    type = string
}
#variable "v_environment"{
#    description = "mode: prod or dev"
#}
variable "v_region_location"{
    type = string
}
variable "v_vm_subnet_name"{
    type = string
}
variable "v_vnet_address_space"{
    type = list
}
variable "v_subnet_prefixes"{
    type = list
}
variable "v_nic_name_vm"{
    type = string
}
variable "v_vm_public_ip" {
    type = string
}
variable "v_vm_size" {
    type = string
}
variable "v_vm_username" {
    type = string
}
variable "v_vm_password" {
    type = string
}