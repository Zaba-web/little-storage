import { writable } from "svelte/store";
import aepIcon from "../assets/icons/files/text_color_aep.svg";
import aiIcon from "../assets/icons/files/text_color_ai.svg";
import aviIcon from "../assets/icons/files/text_color_avi.svg";
import blendIcon from "../assets/icons/files/text_color_blend.svg";
import c4dIcon from "../assets/icons/files/text_color_c4d.svg";
import cdrIcon from "../assets/icons/files/text_color_cdr.svg";
import cssIcon from "../assets/icons/files/text_color_css.svg";
import csvIcon from "../assets/icons/files/text_color_csv.svg";
import dmgIcon from "../assets/icons/files/text_color_dmg.svg";
import docIcon from "../assets/icons/files/text_color_doc.svg";
import exeIcon from "../assets/icons/files/text_color_exe.svg";
import figIcon from "../assets/icons/files/text_color_fig.svg";
import gifIcon from "../assets/icons/files/text_color_gif.svg";
import htmlIcon from "../assets/icons/files/text_color_html.svg";
import icoIcon from "../assets/icons/files/text_color_ico.svg";
import javaIcon from "../assets/icons/files/text_color_java.svg";
import jpegIcon from "../assets/icons/files/text_color_jpeg.svg";
import jpgIcon from "../assets/icons/files/text_color_jpg.svg";
import jsIcon from "../assets/icons/files/text_color_js.svg";
import jsonIcon from "../assets/icons/files/text_color_json.svg";
import movIcon from "../assets/icons/files/text_color_mov.svg";
import mp3Icon from "../assets/icons/files/text_color_mp3.svg";
import mp4Icon from "../assets/icons/files/text_color_mp4.svg";
import mpgIcon from "../assets/icons/files/text_color_mpg.svg";
import pdfIcon from "../assets/icons/files/text_color_pdf.svg";
import pngIcon from "../assets/icons/files/text_color_png.svg";
import pptIcon from "../assets/icons/files/text_color_ppt.svg";
import psdIcon from "../assets/icons/files/text_color_psd.svg";
import rarIcon from "../assets/icons/files/text_color_rar.svg";
import sktIcon from "../assets/icons/files/text_color_skt.svg";
import svgIcon from "../assets/icons/files/text_color_svg.svg";
import tiffIcon from "../assets/icons/files/text_color_tiff.svg";
import txtIcon from "../assets/icons/files/text_color_txt.svg";
import wavIcon from "../assets/icons/files/text_color_wav.svg";
import webpIcon from "../assets/icons/files/text_color_webp.svg";
import xlsIcon from "../assets/icons/files/text_color_xls.svg";
import zipIcon from "../assets/icons/files/text_color_zip.svg";
import fileIcon from "../assets/icons/files/unknown.svg";
import dirIcon from "../assets/icons/files/directory.svg";

const fileTypeIcons = {
  "aep": aepIcon,
  "ai": aiIcon,
  "avi": aviIcon,
  "blend": blendIcon,
  "c4d": c4dIcon,
  "cdr": cdrIcon,
  "css": cssIcon,
  "csv": csvIcon,
  "dmg": dmgIcon,
  "doc": docIcon,
  "docx": docIcon,
  "exe": exeIcon,
  "fig": figIcon,
  "gif": gifIcon,
  "html": htmlIcon,
  "ico": icoIcon,
  "java": javaIcon,
  "jpeg": jpegIcon,
  "jpg": jpgIcon,
  "js": jsIcon,
  "json": jsonIcon,
  "mov": movIcon,
  "mp3": mp3Icon,
  "mp4": mp4Icon,
  "mpg": mpgIcon,
  "pdf": pdfIcon,
  "png": pngIcon,
  "ppt": pptIcon,
  "psd": psdIcon,
  "rar": rarIcon,
  "skt": sktIcon,
  "svg": svgIcon,
  "tiff": tiffIcon,
  "txt": txtIcon,
  "wav": wavIcon,
  "webp": webpIcon,
  "xls": xlsIcon,
  "xlsx": xlsIcon,
  "zip": zipIcon,
  "dir": dirIcon,
  "default": fileIcon
}

export const fileIcons = writable(fileTypeIcons)

